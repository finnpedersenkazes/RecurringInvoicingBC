PageExtension 50104 SubscriptionOrders extends "Blanket Sales Orders"
{
    actions
    {
        addafter("Request Approval")
        {
            group(Subscription)
            {
                Caption = 'Subscription';
                action(CalculateQuantitytoShip)
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate Quantity to Ship';
                    Image = CalculatePlan;
                    RunObject = Report "Qty to Ship Calc Batch";
                }
                action(MakeOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Make Orders';
                    Image = MakeOrder;
                    RunObject = Report "Make Orders Batch";
                }
                action(CalculateNextInvoicingPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate Next Invoicing Period';
                    Image = CalculatePlan;
                    RunObject = Report "Next Periode Calc Batch";
                }
            }
        }
    }
}

