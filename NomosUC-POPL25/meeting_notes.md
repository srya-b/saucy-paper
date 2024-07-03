# May 24
* trimmed a lot of space in preparation for most of the last section trying to convince the reader that things work with a more fleshed out example
	- rather than all the code, i'm trying to do an execution trace: follow a call to commit from Z sending it, to partywrapper, to pi, to partywrapper to functionality to adversary back to environment
	- ideal world: commit from Z, to simulator, to simulation, to 
	the point here being that we explain what the types are of all the expanded code for providerless channels and the virtualization to make it concrete and clear why this works
* multisession remains unchanged i think this is convincing enough, then multisession is simple enough composition since we've shown how the constructs work in single composition.
	- for full composition just an implication
