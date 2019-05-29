Report 50102 "Make Orders Batch"
{
    Caption = 'Make Orders from Blanket Order Lines ready to ship';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting ("Document Type", "No.") where ("Document Type" = const ("Blanket Order"));
            RequestFilterFields = "No.", Status;
            RequestFilterHeading = 'Blanket Sales Order';

            trigger OnAfterGetRecord()
            begin
                Counter := Counter + 1;
                Window.Update(1, "No.");
                Window.Update(2, ROUND(Counter / CounterTotal * 10000, 1));
                Clear(BlanketSalesOrdertoOrder);
                if BlanketSalesOrdertoOrder.Run("Sales Header") then begin
                    CounterOK := CounterOK + 1;
                    if MarkedOnly then
                        Mark(false);
                end;
            end;

            trigger OnPostDataItem()
            begin
                Window.Close;
                Message(Text002, CounterOK, CounterTotal);
            end;

            trigger OnPreDataItem()
            begin
                CounterTotal := Count;
                Window.Open(Text001);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Text001: label 'Updating Blanket Orders  #1########## @2@@@@@@@@@@@@@';
        Text002: label '%1 blanket orders out of a total of %2 have now been evaluated.';
        BlanketSalesOrdertoOrder: Codeunit "Blanket Sales Order to Order";
        Window: Dialog;
        CounterTotal: Integer;
        Counter: Integer;
        CounterOK: Integer;

    procedure InitializeRequest()
    begin
    end;
}

