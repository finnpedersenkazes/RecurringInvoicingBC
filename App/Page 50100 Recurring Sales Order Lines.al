Page 50100 "Recurring Sales Order Lines"
{
    Caption = 'Recurring Sales Order Lines';
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = where ("Document Type" = const ("Blanket Order"),
                            "Subscription Type" = filter (Recurring | Stop));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(SelltoCustomerNo; "Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(SubscriptionType; "Subscription Type")
                {
                    ApplicationArea = Basic;
                }
                field(SubscriptionPeriodicity; "Subscription Periodicity")
                {
                    ApplicationArea = Basic;
                }
                field(ShipmentDate; "Shipment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(UnitofMeasure; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(QtytoShip; "Qty. to Ship")
                {
                    ApplicationArea = Basic;
                }
                field(UnitPrice; "Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(LineDiscount; "Line Discount %")
                {
                    ApplicationArea = Basic;
                }
                field(LineDiscountAmount; "Line Discount Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(QuantityInvoiced; "Quantity Invoiced")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

