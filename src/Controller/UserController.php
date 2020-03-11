<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\AdminUserType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

/**
 * @Route("/admin/user")
 */
class UserController extends AbstractController {

    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder) {
        $this->encoder = $encoder;
    }

    /**
     * @Route("/", name="user_index")
     */
    public function index() {
        $em = $this->getDoctrine()->getManager();

        $users = $em->getRepository(User::class)->findAll();

        return $this->render('medewerker/user/index.html.twig', [
            'users' => $users,
        ]);
    }

    /**
     * @Route("/update/{id}", name="user_update")
     */
    public function update(Request $request, $id) {
        $em = $this->getDoctrine()->getManager();

        $user = $em->getRepository(User::class)->find($id);

        $form = $this->createForm(AdminUserType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $plainPassword = $form->getData()['password'];

            $encodedPassword = $this->encoder->encodePassword($user, $plainPassword);

            $user->setPassword($encodedPassword);

            $em->persist($user);
            $em->flush();

            $this->addFlash('notice', 'Wachtwoord aangepast');
            return $this->redirectToRoute('user_index');
        }

        return $this->render('medewerker/user/update.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/delete/{id}", name="user_delete")
     */
    public function delete($id) {
        $em = $this->getDoctrine()->getManager();

        $user = $em->getRepository(User::class)->find($id);

        $em->remove($user);
        $em->flush();

        $this->addFlash('error', ' succesvol verwijderd');
        return $this->redirectToRoute('user_index');
    }
}
