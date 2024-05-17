# Revision Progress
* execUC
* ~~partywrapper
* ~~fcom example
* example protocol with providerless channel expansion
* database ideal functionality expanded


# The general framework and how main processes are connected
The main parties are:
1. environment
2. partywarpper
3. adversary
4. ideal functionality

The are all connected by providerless channels, which means each of them see a
linear channel that connects them to the other main partiers.  For example,
`party_wrapper` sees $z2p $p2z $f2p $p2f $a2p $p2a. 


## Inside the party wrapper
The party wrapper connects to the protocol parties with only half a
providerless channel.  A normal providerless channel is a (linear channel) <-->
communicator <--> (linear channel).  In the party wrapper the main body of the
wrapper is connected to the party by:

	[Wrapper code] <--> communicator <--> (linear channel) <--> [Protocol Party]

This is for ease of use and make it easy to store the channels in a list.

TODO
* are single types like z2p okay? like they will only read when the label is sent right?
* the pump channel to give back to the environment

""Syntax Sugar""
All the sugar used in the party wrapper:
* we exclude `acquire`/`release` for the all shared
* we exclude the search and exists functions for the lists
* `channel_init` only takes the place of some comuncator things not the generic providerless channel constructor
* __Case statements__: case statements assume acquire lock so that they wait until something might have been written on the channel

""Import Type Parameter""
The party wrapper only needs import type parameters for the generic types
because the protocol-specific session typs have a fixed import amount set for
them.

""Session Types of Main Channels""
Because the party wrapper must channel communication for all protocol parties,
its channels are of a generic type rather than a protcol specific session type.
For example:

	`type Z2P[m]{n} = +{ z2p: |{n}> PID * m * Z2P[m]{n} }`
	`type P2Z[m]{n} = &{ p2z: |{n}> PID * m * P2Z[m]{n} }`

The channels within the party wrapper, that connect to the protocol parties
themselves have the protocol-specific channels.

""Creating New Parties""
When a new PID is written to the protocol party is spawned by calling the
generic `PS.prot` constructor.  The constructor is a wrapped representation of
the underlying protocol code.  We rely on code generation to create this
wrapped representation that first spawns the necessary intermediate processes
to facilitate the providerless channel mechanism for this piece of code.  In
general, all processes that use providerless channels are wrapped by generated
code that specifies the code for the providerless channel to work.

The important point is that providerless channels are just a sequence of
processes that do some conversion between types and the code the programmer
writes is just syntactic sugar that is replaced at compile time.


""Checking for party output""
After every activation of the `party_wrapper` by z2p, f2p, or a2p it
transitions to a process that then iterates through the outgoing channels of
the activated party to get some output.  The output can be on any of the
channels, and it becomes useful to have communicators here so the wrapper can
poll for a message and continue to the next channel if non is present.  The
activated protocol party must pass control away at some point so the party
wrapper will check indefinitely if it has to until some activation is seen.
The special channel for returning control to the adversary may be activated
here as well if the party does nothing.


## Ideal Functionalities
There are 2-3 types of ideal functionalities and they are handled diffrently, but they all require a demultiplexer to interpret incoming messages based on PID:
1. Deterministic number of parties
2. An arbitrary number of parties
	a. with distinct and unique roles
	b. without distinct roles

Examples of each:
1. Single `F_com` between one sender and one receiver only requires 2 channels.
2. a) an exchange where parties can be both makers and takers.
   b) `F_database` where arbitrary many parties can insert and query. They all use the same session type. 

""Type 1: statically determined parties""
This type requires minimal treatment aside from demultiplexing the input. 
`F_com` is typed:
 
### Fcomchan
Both a commitment functionality and a general message passing functionality.
The functionality activates the adverasry first on message sends and on commit/open.
There's not clear disadvantage to this. It's just easier than query and stuff.
It's also more canonical.

TODO: we can check PID in generated code or in F-com just add pid to all sessions to forwarding code doesn't do any checking
TODO: change Fcom to work with activating the adv directly.
TODO: double-sided import params for `wrap_f` or not
TODO: adv import parameter one one channel only one-way
