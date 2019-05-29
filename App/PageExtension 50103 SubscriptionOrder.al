PageExtension 50103 SubscriptionOrder extends "Blanket Sales Order"
{
    actions
    {
        addafter(Approval)
        {
            group(Subscription)
            {
                Caption = 'Subscription';
                action("Calculate Quantity to Ship")
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate Quantity to Ship';
                    Image = CalculatePlan;

                    trigger OnAction()
                    var
                        SubscriptionManagement: Codeunit SubscriptionManagement;
                    begin
                        SubscriptionManagement.CalculateQuantityToShipYN(Rec);
                    end;
                }
                action(MakeOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Make Order';
                    Image = MakeOrder;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.PrePostApprovalCheckSales(Rec) then
                            Codeunit.Run(Codeunit::"Blnkt Sales Ord. to Ord. (Y/N)", Rec);
                    end;
                }
                action("Calculate Next Subscription Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate Next Subscription Period';
                    Image = CalculatePlan;

                    trigger OnAction()
                    var
                        SubscriptionManagement: Codeunit SubscriptionManagement;
                    begin
                        SubscriptionManagement.CalculateNextSubscriptionPeriodYN(Rec);
                    end;
                }
            }
        }
    }
}
