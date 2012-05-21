CMVolumeSlider
==============

VolumeSlider-class to control iOS device volume.

Why?
--------------

Also tried to add an UISlider to your application to control the volume of the iOS device/your application?
Discovered the MPVolumeView-class and noticed the limitations?

Apple is offering us a MPVolumeView-class. This view contains a `UISlider` we can add easily on a view in our application,
allowing the user to manage the volume, but there are some limitations

1. The interface:  This view looks like a Mac OS X slider but on iOS. The slider has big differences to a normal iOS slider.
See an example at http://joong.org/uploads/iPhone2waystocontrolvolume_DDD4/capture1.png . See the differences between both sliders?
Since the MPVolumeView is a custom class, we are not able to modify this class easily

2. Another limitation is the possibility to change the volume via code.

What is it and usage?
--------------

The CMVolumeSlider is a small wrapper converting the MPVolumeView to a normal UISlider, which can be themed quite easily.
It allows us to add a normal UISlider on our application that will take care of the volume control.
Simply add the class to your project and add a CMVolumeSlider to an existing view (via code or InterfaceBuilder) and done.

Credits and rights
--------------

More information at info@codingmammoth.com , please feel free to share/alter the class
