+hungry(Food) : cost(Food, Price) & has_money(Money, guest) & Money > Price & sells(Food, buffet)
 <- !try_to_come_in(guest)
    !try_to_buy(Food, Price, buffet, guest)

+!try_to_buy(Food, Price, buffet, guest) : hungry(Food)
 <- buy_food(Food, Price, buffet, guest)
    !try_to_buy(Food, Price, buffet, guest)

+!try_to_buy(Food, Price, buffet, guest) : true
 <- true

+bored(guest) : knows(guest, other)
 <- !try_to_come_in(guest)
    !talk_with(guest, other)
    -bored(guest)

+bored(guest) : doesnt_know(guest, other)
 <- !try_to_come_in(guest)
    !get_to_know(guest, other)
    !talk_with(guest, other)
    -bored(guest)

+lonely(guest) : doesnt_know(guest, other)
 <- !try_to_come_in(guest)
    !get_to_know(guest, other)
    -lonely(guest)

+lonely(guest) : true
 <- -lonely(guest)

+!get_to_know(guest, other) : not knows(guest, other)
 <- try_to_get_to_know(guest, other)
    !get_to_know(guest, other)

+!get_to_know(guest, other) : true
 <- true

+!talk_with(guest, other) : not talking(guest, other)
 <- try_to_talk(guest, other)
    !talk_with(guest, other)

+!talk_with(guest, other) : talking(guest, other)
 <- -talking(guest, other)

+!try_to_come_in(guest) : is_doorman(doorman) & not inside(guest)
 <- attempt_entry(guest, doorman)
    !try_to_come_in(guest)

+!try_to_come_in(guest) : inside(guest)
 <- true