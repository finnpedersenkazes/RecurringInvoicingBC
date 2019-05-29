pageextension 50100 "SubscriptionItemCard" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group(Subscription)
            {
                field("Subscription type"; "Subscription type")
                {
                }

                field("Subscription Periodicity"; "Subscription Periodicity")
                {
                }
            }
        }
    }
}