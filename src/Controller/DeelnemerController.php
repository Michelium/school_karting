<?php

namespace App\Controller;


use App\Entity\User;
use App\Form\UserType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class DeelnemerController extends AbstractController {

    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder) {
        $this->encoder = $encoder;
    }

    /**
     * @Route("/user/activiteiten", name="activiteiten")
     */
    public function activiteitenAction() {
        $usr = $this->get('security.token_storage')->getToken()->getUser();

        $beschikbareActiviteiten = $this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->getBeschikbareActiviteiten($usr->getId());

        $ingeschrevenActiviteiten = $this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->getIngeschrevenActiviteiten($usr->getId());

        $totaal = $this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->getTotaal($ingeschrevenActiviteiten);


        return $this->render('deelnemer/activiteiten.html.twig', [
            'beschikbare_activiteiten' => $beschikbareActiviteiten,
            'ingeschreven_activiteiten' => $ingeschrevenActiviteiten,
            'totaal' => $totaal,
        ]);
    }

    /**
     * @Route("/user/inschrijven/{id}", name="inschrijven")
     */
    public function inschrijvenActiviteitAction($id) {

        $activiteit = $this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->find($id);
        $usr = $this->get('security.token_storage')->getToken()->getUser();
        $usr->addActiviteit($activiteit);

        $em = $this->getDoctrine()->getManager();
        $em->persist($usr);
        $em->flush();

        return $this->redirectToRoute('activiteiten');
    }

    /**
     * @Route("/user/uitschrijven/{id}", name="uitschrijven")
     */
    public function uitschrijvenActiviteitAction($id) {
        $activiteit = $this->getDoctrine()
            ->getRepository('App:Activiteit')
            ->find($id);
        $usr = $this->get('security.token_storage')->getToken()->getUser();
        $usr->removeActiviteit($activiteit);
        $em = $this->getDoctrine()->getManager();
        $em->persist($usr);
        $em->flush();
        return $this->redirectToRoute('activiteiten');
    }

    /**
     * @Route("/user/profile/", name="deelnemer_profile")
     */
    public function profile(Request $request) {
        $em = $this->getDoctrine()->getManager();
        $userProvider = $this->getUser();
        $user = $em->getRepository(User::class)->findOneBy(['username' => $userProvider->getUsername()]);

        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            if (isset($request->request->all()['user']['plainPassword'])) {
                $plainPassword = $request->request->all()['user']['plainPassword']['first'];
                $encodedPassword = $this->encoder->encodePassword($user, $plainPassword);

                $user->setPassword($encodedPassword);
            }

            $em->persist($user);
            $em->flush();

            $this->addFlash('notice', 'Profiel succesvol aangepast');
            return $this->redirectToRoute('deelnemer_profile');
        }

        return $this->render('deelnemer/profile.html.twig', [
            'form' => $form->createView(),
        ]);
    }

}
