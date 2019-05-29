Report 50100 "Next Periode Calc Batch"
{
    Caption = 'Calculate Next Subscription Period';
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
                Clear(SubscriptionManagement);
                SubscriptionManagement.CalculateNextSubscriptionPeriodOne("Sales Header");
                CounterOK := CounterOK + 1;
                if MarkedOnly then
                    Mark(false);
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
        SubscriptionManagement: Codeunit SubscriptionManagement;
        Window: Dialog;
        CounterTotal: Integer;
        Counter: Integer;
        CounterOK: Integer;

    procedure InitializeRequest()
    begin
    end;
}

