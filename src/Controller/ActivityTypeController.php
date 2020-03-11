<?php

namespace App\Controller;

use App\Entity\ActivityType;
use App\Form\ActivityTypeType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/activitytype")
 */
class ActivityTypeController extends AbstractController {

    /**
     * @Route("/", name="activitytype_index")
     */
    public function index() {
        $em = $this->getDoctrine()->getManager();

        $activityTypes = $em->getRepository(ActivityType::class)->findAll();
        $activityTypeForm = $this->createForm(ActivityTypeType::class);

        return $this->render('medewerker/activitytype/index.html.twig', [
            'activityTypes' => $activityTypes,
            'activityTypeForm' => $activityTypeForm->createView(),
        ]);
    }

    /**
     * @Route("/modify/{id}", name="activitytype_modify", defaults={"id" : null})
     */
    public function modify($id, Request $request) {
        $em = $this->getDoctrine()->getManager();
        $data = $request->request->all()['activity_type'];

        if ($id) {
            $activityType = $em->getRepository(ActivityType::class)->find($id);
        } else {
            $activityType = new ActivityType();
        }

        $activityType->setNaam($data['naam']);
        $activityType->setMinLeeftijd($data['minLeeftijd']);
        $activityType->setTijdsduur($data['tijdsduur']);
        $activityType->setPrijs($data['prijs']);
        $activityType->setBeschrijving($data['beschrijving']);

        $em->persist($activityType);
        $em->flush();

        $type = $id ? 'aangepast' : 'toegevoegd';
        $this->addFlash('notice', "Activiteit succesvol " . $type);

        return $this->redirectToRoute('activitytype_index');
    }

    /**
     * @Route("/update/{id}", name="activitytype_update")
     */
    public function update($id) {
        $em = $this->getDoctrine()->getManager();
        $activityType = $em->getRepository(ActivityType::class)->find($id);

        $activityTypeForm = $this->createForm(ActivityTypeType::class, $activityType);

        return $this->render('medewerker/activitytype/update.html.twig', [
            'activityTypeForm' => $activityTypeForm->createView(),
            'id' => $id,
        ]);
    }

    /**
     * @Route("/delete/{id}", name="activitytype_delete")
     */
    public function delete($id) {
        $em = $this->getDoctrine()->getManager();

        $activityType = $em->getRepository(ActivityType::class)->find($id);

        $em->remove($activityType);
        $em->flush();

        $this->addFlash('error', "Activiteit soort succesvol verwijderd");
        return $this->redirectToRoute('activitytype_index');
    }


}
