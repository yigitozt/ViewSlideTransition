ViewSlideTransition
===================
Slide between two view

-Slides smoothly between two views and rotates an view in scene(optional).

Instructions(for 4' retina screen, you can change the values for other screens)
You have to use navigation controller

In Storyboard
- Add a view first, let say it mainBigView (frame: 0,0,640,568)
- Add 2 views in the mainBigView and name them view1, view2 (frameforview1: 0,0,320,568) (frameforview2: 320,0,320,568)
- Add a view between two views inside of mainBigView. This is for rotating animation while transition.(optional)
- Now specify them in the ViewController's .h file.
- Let's say them mainBigView,firstView,secondView,rotatingObject

Code

1-Add a gesture recognizer in the ViewController

  @property(strong, nonatomic)UILongPressGestureRecognizer * tapGesture;

2-Initialize the recognizer in viewDidLoad

    self.tapGesture = [UILongPressGestureRecognizer new];
  
    [self.tapGesture addTarget:self action:@selector(tapScreen:)];
    
    self.tapGesture.minimumPressDuration = 0.001f;
    
    [self.view addGestureRecognizer:self.tapGesture];
    
3-Write down the tapScreen method

    - (IBAction)tapScreen:(id)sender
    {
    
    }
   
4- Add the makeAnimatedCrossFadeWithFirstView method inside
      
      [Storage makeAnimatedCrossFadeWithFirstView:<#(UIView *)#> secondView:<#(UIView *)#> mainBigView:<#(UIView *)#>      rotatingObject:<#(UIView *)#> currentView:<#(UIView *)#> currentController:<#(UIViewController *)#> currentLongPressGesture:<#(UILongPressGestureRecognizer *)#> makeNavigationBarDissappear:<#(BOOL)#>];
  
5- Now fill the areas with views that we specified before. If you have no rotating object, you can write nil.

    [Storage makeAnimatedCrossFadeWithFirstView:self.firstView secondView:self.secondView mainBigView:self.mainBigView   rotatingObject:self.rotatingObject currentView:self.view currentController:self currentLongPressGesture:self.tapGesture makeNavigationBarDissappear:YES];
  
