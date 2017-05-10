+needs_resource(A1, handyman) : has_resource(A2, handyman) & A1 > A2 & not repairing(handyman)
 <- ?needs_resource(A1, handyman)
    +shopping(A1, handyman)
    !come_in(handyman)
    -shopping(A1, handyman)
    -has_resource(_, handyman)
    +has_resource(A1, handyman)

-repairing(handyman) : needs_resource(A1, handyman) & has_resource(A2, handyman) & A1 > A2
 <- ?needs_resource(A1, handyman)
    +shopping(A1, handyman)
    !come_in(handyman)
    -shopping(A1, handyman) %Ezidenemkell,majdaJavakódba
    -has_resource(_, handyman)
    +has_resource(A1, handyman)

+!come_in(handyman) : shopping(handyman)
 <- attempt_entry(handyman)
    !come_in(handyman)

+!come_in(handyman) : true
 <- true

+repair_job(T, C, A1) : has_resource(A2, handyman) & A1 < A2 & not shopping(handyman)
 <- +repairing(handyman)
    talk(handyman, C)
    repair(T, A1, handyman)
    -repairing(handyman)

+talk(A,handyman) : know(A, handyman) & not shopping(handyman) & not repairing(handyman)
 <- +talking(handyman)
    converse(A,handyman)

+talk(A, handyman) : not know(A, handyman) & not shopping(handyman) & not repairing(handyman)
 <- refuse(A, handyman)

+talk(A, handyman) : shopping(handyman) | repairing(handyman)
 <- refuse(A, handyman)

+get_to_know(A, handyman) : not shopping(handyman) & not repairing(handyman)
 <- +know(A, handyman)

+get_to_know(A, handyman) : shopping(handyman) | repairing(handyman)
 <- refuse(A, handyman)

 +has_to_shop(A1, C, handyman) : not shopping(handyman) & not repairing(handyman)
  <- +shopping(A1, handyman)
     !come_in(handyman)
     -shopping(A1, handyman) %Ezidenemkell,majdaJavakódba
     deliver(A1, C, handyman)