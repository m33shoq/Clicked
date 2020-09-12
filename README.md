# Clicked

![CI Status](https://github.com/Snakybo/Clicked/workflows/CI/badge.svg)

Clicked is a World of Warcraft addon aimed to improve keybindings and macros. The addon adds a configuration window (`/clicked` or `/cc`) from where all all bindings can be configured to do _something_. You can configure exactly what it does on a per-binding basis, and even merge keys to do different things depending on who the target it.

Additionally it adds support for the binding of the left and right mouse buttons if you prefer clicking on unit frames to cast something.

## Feature Overview

* Create keyboard/mouse button bindings for spells, items, and custom macros
* [Dynamic target priority](#dynamic-target-prioritization)
* Cast abilities by clicking on unit frames
* Run custom macros without taking up a macro slot or 255 character limitations
* [Combine keys to do different things depending on the target](#dynamic-target-prioritization)
* Remove the need for action bar keybindings
* [Dynamically load and unload bindings](#dynamically-load-and-unload-bindings)
* Pick spells from the spellbook
* Unlock bindings in a vehicle

### Dynamic target prioritization

Dynamic priority bindings provide a customizable configuration interface, you can select valid targets for this binding using dropdown menus, and optionally specify the hostility of the target unit.

You can combine as many bindings using the same keybind with this targeting mode as you like as long as they have a different configuration (two bindings that require a friendly mouseover target won't work).

The system will automatically prioritize the bindings based on the current situation. You can combine bindings with a hostile ability when targeting an enemy with healing abilities if you're hovering over a friendly unit frame.

### Dynamically load and unload bindings

Bindings can be set to only load based on a variety of conditions.

* Talent specialization(s)
* Talent selection(s)
* Combat status
* Group status
* Specific player in group
* Stances/shapeshift forms

## Support

[Issue tracker](https://github.com/Snakybo/Clicked/issues)

Please include which version and unit frame addon you're using (`/dump Clicked.VERSION`). If there are specific bindings that are not working include the configurations for those as well.

## Credits

Clicked is inspired by [Clique](https://www.curseforge.com/wow/addons/clique). A lot of the click casting functionality is based of Clique.
