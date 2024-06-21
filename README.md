# ScottishPowerTechTest
A tech test for Scottish Power

Notes:

Quite a fun little challenge, i'll be honest, as i'm still getting to grips with swift UI
I know I've still got a lot to learn.

## Solution

I first identified what i really needed from the model, it didn't really make sense to grab everything. 
I tried to go as simple as possible for the design, I didn't want to over-complicate and as I'm still getting to grips with SwiftUI I didn't want to overburden the UI with bad code. I've tried to support accessibility where possible. Fortunately there wasn't too much to do and SwiftUI handles a lot of it for you compared to UIKit days. 

## Improvements

- Unit tests: There's so many models, extensions and various parts of this I could unit test but I think it would take a lot of time
- Accessibility: I'd probably group elements a little better, at the moment the user needs to scroll through them each, it would be much better to some of them for a better voiceover experience.
- View components: We have reusable components for many elements at SB, I'd have built a lot more of this out with those components, ie: custom Labels'
- Network - It's very basic, I'd have returned more detail back to the user in the response, maybe an error code allowing the implementer to handle those more
- Protocol, ideally the view should be adhearing to the view models protocol, I'm not sure of the syntax of this in SwiftUI just yet.
- Coding keys for the Track model, some of the names could be improved
- A lot of the views shouldn't really have any frame sizes passed directly in and the superview decide their sizes.
