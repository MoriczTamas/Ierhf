work(doorman)
let_last_in(doorman)

+work(doorman) : true
 <- -play(doorman)

 +play(doorman) : true
  <- -work(doorman)

+entry_attempt(A) : work(doorman) & let_last_in(doorman)
 <- -let_last_in(doorman)

 +entry_attempt(A) : work(doorman) & not let_last_in(doorman)
 <- +let_last_in(doorman)
    grant_entry(A)

+talk(A,doorman) : know(A, doorman) & work(doorman)
 <- +talking(doorman)
    converse(A,doorman)

+talk(A, doorman) : not know(A, doorman) & work(doorman)
 <- refuse(A, doorman)

+talk(A, doorman) : play(doorman)
 <- refuse(A, doorman)

+get_to_know(A, doorman) : work(doorman)
 <- +know(A, doorman)

+get_to_know(A, doorman) : play(doorman)
 <- refuse(A, doorman)