<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class photo extends Component
{
    public $photo;
    public $alt;

    /**
     * Create a new component instance.
     */
    public function __construct($photo, $alt)
    {
        if ($photo != "" && $alt) {
            $this->photo = $photo;
            $this->alt = $alt;
        } else {
            $this->photo = 'nophoto.jpg';
            $this->alt = $alt;
        }
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.photo');
    }
}
