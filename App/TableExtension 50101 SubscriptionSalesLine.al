TableExtension 50101 "SubscriptionSalesLine" extends "Sales Line"
{
    fields
    {
        field(50000; "Subscription Type"; Option)
        {
            Caption = 'Subscription Type';
            OptionMembers = " ","Recurring","Stop";
            OptionCaption = ' ,Recurring,Stop';

            trigger OnValidate()
            begin
                if "Subscription Type" = "Subscription Type"::" " then begin
                    Clear("Subscription Periodicity");
                end;
            end;
        }

        field(50001; "Subscription Periodicity"; DateFormula)
        {
            trigger OnValidate()
            var
                DateFormularZero: DateFormula;
                ErrorMessage001: TextConst ENU = 'The Date Formula %1 will not calculate a date in the future. Please enter a correct Date Formula.';
            begin
                if Evaluate(DateFormularZero, '') and ("Subscription Periodicity" = DateFormularZero) then
                    "Subscription Type" := "Subscription Type"::" "
                else
                    if not (CalcDate("Subscription Periodicity", WorkDate()) > WorkDate()) then
                        Error(ErrorMessage001, "Subscription Periodicity");
            end;
        }

    }
}

