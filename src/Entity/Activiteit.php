<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\ORM\Mapping as ORM;

/**
 * Activiteit
 *
 * @ORM\Table(name="activiteiten")
 * @ORM\Entity(repositoryClass="App\Repository\ActiviteitRepository")
 */
class Activiteit
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(name="datum", type="date")
     * @Assert\NotBlank(message="vul een datum in")
     *
     */
    private $datum;

    /**
     * @ORM\Column(name="tijd", type="time")
     * @Assert\NotBlank(message="vul een tijd in")
     *
     */
    private $tijd;

    /**
     * @ORM\ManyToOne(targetEntity="ActivityType", inversedBy="activiteiten")
     * @ORM\JoinColumn(name="soort_id",referencedColumnName="id")
     *
     */
    private $soort;

    /**
     * @ORM\ManyToMany(targetEntity="User", mappedBy="activiteiten")
     */
    private $users;

    /**
     * @ORM\Column(name="maxDeelnemers", type="integer")
     */
    private $maxDeelnemers = 0;

    public function __construct()
    {
        $this->users = new ArrayCollection();
    }

    public function getUsers()
    {
        return $this->users;
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set datum
     *
     * @param \DateTime $datum
     *
     * @return Activiteit
     */
    public function setDatum($datum)
    {

        $this->datum = $datum;

        return $this;
    }

    /**
     * Get datum
     *
     * @return \DateTime
     */
    public function getDatum()
    {
        return $this->datum;
    }

    /**
     * Set tijd
     *
     * @param \DateTime $tijd
     *
     * @return Activiteit
     */
    public function setTijd($tijd)
    {
        $this->tijd = $tijd;

        return $this;
    }

    /**
     * Get tijd
     *
     * @return \DateTime
     */
    public function getTijd()
    {
        return $this->tijd;
    }

    public function getSoort()
    {
        return $this->soort;
    }

    public function setSoort($soort)
    {
        $this->soort=$soort;
    }

    /**
     * @return mixed
     */
    public function getMaxDeelnemers() {
        return $this->maxDeelnemers;
    }

    /**
     * @param mixed $maxDeelnemers
     */
    public function setMaxDeelnemers($maxDeelnemers): void {
        $this->maxDeelnemers = $maxDeelnemers;
    }
}

