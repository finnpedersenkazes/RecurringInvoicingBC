codeunit 50100 SubscriptionManagement
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterCopyFromItem', '', true, true)]
    local procedure SubscriptionOnAfterCopyFromItem(var SalesLine: Record "Sales Line"; Item: Record Item)
    begin
        SalesLine."Subscription Type" := Item."Subscription Type";
        SalesLine."Subscription Periodicity" := Item."Subscription Periodicity";
    end;

    procedure CalculateQuantityToShipYN(SalesHeader: Record "Sales Header")
    var
        ConfirmText: TextConst ENU = 'Do you want to calculate the Quantity to Ship?';
        MessageText: TextConst ENU = 'Quantity to Ship was calculated.';

    begin
        SalesHeader.TestField("Document Type", SalesHeader."Document Type"::"Blanket Order");
        if not Confirm(ConfirmText, false) then
            exit;

        CalculateQuantityToShipOne(SalesHeader);
        Message(MessageText);
    end;

    procedure CalculateQuantityToShipOne(SalesHeader: Record "Sales Header")
    var
        BlanketOrderSalesLine: Record "Sales Line";
    begin
        SalesHeader.TestField("Document Type", SalesHeader."Document Type"::"Blanket Order");

        BlanketOrderSalesLine.Reset();
        BlanketOrderSalesLine.SetRange("Document Type", SalesHeader."Document Type");
        BlanketOrderSalesLine.SetRange("Document No.", SalesHeader."No.");
        BlanketOrderSalesLine.SetRange("Qty. to Ship", 0);
        BlanketOrderSalesLine.SetFilter("Shipment Date", '..%1', WorkDate());
        if BlanketOrderSalesLine.FindSet() then begin
            repeat
                BlanketOrderSalesLine.Validate("Qty. to Ship", BlanketOrderSalesLine.Quantity - BlanketOrderSalesLine."Quantity Invoiced");
                BlanketOrderSalesLine.Modify(true);
            until BlanketOrderSalesLine.Next() = 0;
        end;
    end;

    procedure CalculateNextSubscriptionPeriodYN(SalesHeader: Record "Sales Header")
    var
        ConfirmText: TextConst ENU = 'Do you want to calculate the next Subscription periodes?';
        MessageText: TextConst ENU = 'Next Subscription periods have been calculated.';
    begin
        SalesHeader.TestField("Document Type", SalesHeader."Document Type"::"Blanket Order");
        if not Confirm(ConfirmText, false) then
            exit;

        CalculateNextSubscriptionPeriodOne(SalesHeader);
        Message(MessageText);
    end;

    procedure CalculateNextSubscriptionPeriodOne(SalesHeader: Record "Sales Header")
    var
        BlanketOrderSalesLine: Record "Sales Line";
        NewBlanketOrderSalesLine: Record "Sales Line";
        ExistsBlanketOrderSalesLine: Record "Sales Line";
        NextLineNumber: Integer;

    begin
        SalesHeader.TestField("Document Type", SalesHeader."Document Type"::"Blanket Order");
        NextLineNumber := 0;

        BlanketOrderSalesLine.Reset();
        BlanketOrderSalesLine.SetRange("Document Type", SalesHeader."Document Type");
        BlanketOrderSalesLine.SetRange("Document No.", SalesHeader."No.");
        BlanketOrderSalesLine.SetRange("Subscription Type", BlanketOrderSalesLine."Subscription Type"::Recurring);

        if BlanketOrderSalesLine.FindSet() then
            repeat
                if (BlanketOrderSalesLine.Quantity = BlanketOrderSalesLine."Quantity Invoiced") then begin
                    ExistsBlanketOrderSalesLine.Reset();
                    ExistsBlanketOrderSalesLine.SetRange("Document Type", SalesHeader."Document Type");
                    ExistsBlanketOrderSalesLine.SetRange("Document No.", SalesHeader."No.");
                    ExistsBlanketOrderSalesLine.SetRange(Type, BlanketOrderSalesLine.Type);
                    ExistsBlanketOrderSalesLine.SetRange("No.", BlanketOrderSalesLine."No.");
                    ExistsBlanketOrderSalesLine.SetRange("Shipment Date", CalcDate(BlanketOrderSalesLine."Subscription Periodicity", BlanketOrderSalesLine."Shipment Date"));
                    if not ExistsBlanketOrderSalesLine.FindFirst() then begin
                        // Create a copy of the line and update field by field with Validate
                        NewBlanketOrderSalesLine.Init();
                        NewBlanketOrderSalesLine."Document Type" := BlanketOrderSalesLine."Document Type";
                        NewBlanketOrderSalesLine."Document No." := BlanketOrderSalesLine."Document No.";
                        NewBlanketOrderSalesLine."Line No." := GetNextLineNumber(SalesHeader, NextLineNumber);
                        NewBlanketOrderSalesLine.INSERT(TRUE);
                        NewBlanketOrderSalesLine.VALIDATE(Type, BlanketOrderSalesLine.Type);
                        NewBlanketOrderSalesLine.VALIDATE("No.", BlanketOrderSalesLine."No.");
                        NewBlanketOrderSalesLine.VALIDATE(Description, BlanketOrderSalesLine.Description);
                        NewBlanketOrderSalesLine.VALIDATE("Unit Price", BlanketOrderSalesLine."Unit Price");
                        NewBlanketOrderSalesLine.VALIDATE(Quantity, BlanketOrderSalesLine.Quantity);
                        NewBlanketOrderSalesLine.VALIDATE("Qty. to Ship", 0);
                        NewBlanketOrderSalesLine.VALIDATE("Shipment Date", CALCDATE(BlanketOrderSalesLine."Subscription Periodicity", BlanketOrderSalesLine."Shipment Date"));
                        NewBlanketOrderSalesLine.VALIDATE("Subscription Type", BlanketOrderSalesLine."Subscription Type");
                        NewBlanketOrderSalesLine.VALIDATE("Subscription Periodicity", BlanketOrderSalesLine."Subscription Periodicity");
                        NewBlanketOrderSalesLine.MODIFY(TRUE);
                    end;
                end;
            until BlanketOrderSalesLine.Next() = 0;
    end;

    local procedure GetNextLineNumber(SalesHeader: Record "Sales Header"; var NextLineNumber: Integer): Integer;
    var
        SalesLine: Record "Sales Line";
    begin
        if NextLineNumber <= 0 then begin
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            if SalesLine.FindLast() then
                NextLineNumber := SalesLine."Line No." + 10000
            else
                NextLineNumber := 0;
        end;
        NextLineNumber := NextLineNumber + 10000;
        exit(NextLineNumber);
    end;
}