+buy_attempt(A1, C, Item) : has_resource(A2, buffet) & not talking(buffet) & A1 < A2
 <- ?price(Item, P1)
    serve(C, Item, P1)
    !restock(buffet)
    ?has_money(P2, buffet)
    -has_money(P2, buffet)
    +has_money(P1+P2, buffet)

+buy_attempt(A1, C, Item) : talking(buffet)
 <- refuse(C, buffet)

+buy_attempt(A1, C, Item) : has_resource(A2, buffet) & A1 > A2
 <- refuse(C, buffet)
    !restock(buffet)

+!restock(buffet) : has_resource(A2, buffet) & needs_resource(A1, buffet) & A1 > A2
 <- ask_to_shop(A1, handyman)
    !restock(buffet)

+!restock(buffet) : true
 <- true

+talk(A,buffet) : know(A, buffet) & not talking(buffet)
 <- +talking(buffet)
    converse(A,buffet)
    -talking(buffet)

+talk(A, buffet) : not know(A, buffet) | talking(buffet)
 <- refuse(A, buffet)

+get_to_know(A, buffet) : not talking(buffet)
 <- +know(A, buffet)

+get_to_know(A, buffet) : talking(buffet)
 <- refuse(A, buffet)

+resource_failed(buffet, R) : true
 <- +fixing(buffet)
    !get_resource_fixed(buffet, R)
    -resource_failed(buffet, R) %ezismajdJava

+!get_resource_fixed(buffet, R) : resource_failed(buffet, R)
 <- ask_for_fix(buffet, handyman)
    !get_resource_fixed(buffet, R)

+!get_resource_fixed(buffet, R) : true
 <- true