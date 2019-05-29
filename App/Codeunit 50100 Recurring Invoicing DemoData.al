Codeunit 50101 SubscriptionDemoData
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Subscription DemoData"(Codeunit 50100)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=03022017D;
        //      Time=120000T;
        //      Version List=SUBS1.03;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Subscription DemoData"(Codeunit 50100);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          // Set the date for the simulation
        //                                          WORKDATE := DMY2DATE(8,1,2018);
        //  
        //                                          // Create Items
        //  
        //                                          ItemSubscriptionRecurring := 1;
        //                                          EVALUATE(DateFormularValue,'<1Y>');
        //                                          InsertItem('YEARLY','Yearly Service',100,ItemSubscriptionRecurring,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1M>');
        //                                          InsertItem('MONTHLY','Monthly Service',100,ItemSubscriptionRecurring,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1W>');
        //                                          InsertItem('WEEKLY','Weekly Service',100,ItemSubscriptionRecurring,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1Q>');
        //                                          InsertItem('QUATERLY','Quarterly Service',100,ItemSubscriptionRecurring,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1D>');
        //                                          InsertItem('DAILY','Daily Service',100,ItemSubscriptionRecurring,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'');
        //                                          InsertItem('NORMAL','Onetime Service',100,0,DateFormularValue);
        //  
        //                                          // Create Customers
        //                                          // Make sure that no contacts are added in the CRM
        //                                          MarketingSetup.GET('');
        //                                          MarketingSetup."Bus. Rel. Code for Customers" := '';
        //                                          MarketingSetup.MODIFY(TRUE);
        //  
        //                                          InsertManyCustomers(3);
        //  
        //                                          Simulator;
        //  
        //                                          MESSAGE('Demonstration Data was inserted.');
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..3
        //                                          // Insert Demo Location. Used for easy filtering on records
        //                                          InsertLocation('DEMO','Demo Location');
        //  
        //                                          // Create Items
        //                                          ItemInvoicingType := 1; // Recurring Invoicing
        //                                          EVALUATE(DateFormularValue,'<1Y>');
        //                                          InsertItem('YEARLY','Yearly Service',100,ItemInvoicingType,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1M>');
        //                                          InsertItem('MONTHLY','Monthly Service',100,ItemInvoicingType,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1W>');
        //                                          InsertItem('WEEKLY','Weekly Service',100,ItemInvoicingType,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1Q>');
        //                                          InsertItem('QUATERLY','Quarterly Service',100,ItemInvoicingType,DateFormularValue);
        //                                          EVALUATE(DateFormularValue,'<1D>');
        //                                          InsertItem('DAILY','Daily Service',100,ItemInvoicingType,DateFormularValue);
        //                                          #17..25
        //                                          // InsertManyCustomers('00000',3);
        //                                          // InsertManyCustomers('00003',3);
        //                                          InsertManyCustomers('00006',3);
        //                                          // InsertManyCustomers('00009',3);
        //                                          // InsertManyCustomers('00012',3);
        //  
        //                                          // Simulator; // No longer needed. User batch jobs
        //  
        //                                          MESSAGE('Demonstration Data was inserted.');
        //                                        END;
        //  
        //                           Target=OnRun }
        //      { PropertyModification;
        //                           Target=InsertItem(PROCEDURE 1100267000).ItemSubscriptionType(Parameter 1100267005);
        //                           Property=Name;
        //                           OriginalValue=ItemSubscriptionType;
        //                           ModifiedValue=ItemInvoicingType }
        //      { PropertyModification;
        //                           Target=InsertItem(PROCEDURE 1100267000).ItemSubscriptionPeriodicity(Parameter 1100267006);
        //                           Property=Name;
        //                           OriginalValue=ItemSubscriptionPeriodicity;
        //                           ModifiedValue=ItemInvoicingPeriodicity }
        //      { Deletion          ;Target=InsertItem(PROCEDURE 1100267000).ItemExists(Variable 1100267003);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             ItemExists@1100267003 : Boolean;
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          ItemExists := Item.GET(ItemNumber);
        //  
        //                                          IF NOT ItemExists THEN BEGIN
        //                                            Item.INIT;
        //                                            Item.VALIDATE("No.",ItemNumber);
        //                                            Item.VALIDATE(Type,1); // Service
        //                                          #7..10
        //                                          Item.VALIDATE("Base Unit of Measure",'PCS');
        //                                          Item.VALIDATE("Gen. Prod. Posting Group",'SERVICES');
        //                                          Item.VALIDATE("VAT Prod. Posting Group",'TVA20');
        //                                          Item.VALIDATE("Subscription Type",ItemSubscriptionType);
        //                                          Item.VALIDATE("Subscription Periodicity",ItemSubscriptionPeriodicity);
        //  
        //                                          Item.MODIFY(TRUE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          IF NOT Item.GET(ItemNumber) THEN BEGIN
        //                                          #4..13
        //                                          Item.VALIDATE("Invoicing Type",ItemInvoicingType);
        //                                          Item.VALIDATE("Invoicing Periodicity",ItemInvoicingPeriodicity);
        //  
        //                                          Item.MODIFY(TRUE);
        //                                        END;
        //  
        //                           Target=InsertItem(PROCEDURE 1100267000) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF Customer.GET(CustomerNumber) THEN
        //                                            Customer.DELETE(TRUE);
        //  
        //                                          Customer.INIT;
        //                                          Customer.VALIDATE("No.",CustomerNumber);
        //                                          Customer.VALIDATE(Name,CustomerName);
        //                                          Customer.INSERT(TRUE);
        //                                          Customer.VALIDATE(Contact,'Finn Pedersen');
        //                                          Customer.VALIDATE("Gen. Bus. Posting Group",'NATIONAL');
        //                                          Customer.VALIDATE("VAT Bus. Posting Group",'NATIONAL');
        //                                          Customer.VALIDATE("Customer Posting Group",'FRANCE');
        //                                          Customer.VALIDATE("Salesperson Code",'DD');
        //                                          Customer.VALIDATE("Country/Region Code",'FR');
        //  
        //                                          Customer.MODIFY(TRUE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          IF NOT Customer.GET(CustomerNumber) THEN BEGIN
        //                                            Customer.INIT;
        //                                            Customer.VALIDATE("No.",CustomerNumber);
        //                                            Customer.INSERT(TRUE);
        //                                          END;
        //                                          Customer.VALIDATE(Name,CustomerName);
        //                                          // Customer.VALIDATE(Contact,'Finn Pedersen');
        //                                          #9..13
        //                                          Customer.VALIDATE("Location Code",'DEMO');
        //                                          Customer.MODIFY(TRUE);
        //                                        END;
        //  
        //                           Target=InsertCustomer(PROCEDURE 1100267001) }
        //      { Insertion         ;Target=InsertManyCustomers(PROCEDURE 1100267002);
        //                           ChangedElements=ParameterCollection
        //                           {
        //                             { 1100267003;StartingCode       ;Code         ;Length=20 }
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CustomerCode := '00000';
        //                                          FOR i := 1 TO HowManyCustomers DO BEGIN
        //                                            CustomerCode := INCSTR(CustomerCode);
        //                                            InsertCustomer(STRSUBSTNO('DEMO%1',CustomerCode),STRSUBSTNO('Customer %1',CustomerCode));
        //                                            InsertBlanketOrderHeader(STRSUBSTNO('SUBS%1',CustomerCode),STRSUBSTNO('DEMO%1',CustomerCode));
        //                                            InsertBlanketOrderLine(STRSUBSTNO('SUBS%1',CustomerCode),10000);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          CustomerCode := StartingCode;
        //                                          #2..4
        //                                            InsertBlanketOrderHeader(STRSUBSTNO('RECURRING%1',CustomerCode),STRSUBSTNO('DEMO%1',CustomerCode));
        //                                            InsertBlanketOrderLine(STRSUBSTNO('RECURRING%1',CustomerCode),10000);
        //                                          END;
        //                                        END;
        //  
        //                           Target=InsertManyCustomers(PROCEDURE 1100267002) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF SalesHeader.GET(SalesHeader."Document Type"::"Blanket Order",OrderNumber) THEN
        //                                            SalesHeader.DELETE(TRUE);
        //  
        //                                          SalesHeader.INIT;
        //                                          SalesHeader."Document Type" := SalesHeader."Document Type"::"Blanket Order";
        //                                          SalesHeader."No." := OrderNumber;
        //                                          SalesHeader.INSERT(TRUE);
        //                                          SalesHeader.VALIDATE("Sell-to Customer No.",CustomerNumber);
        //                                          SalesHeader.MODIFY(TRUE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          IF NOT SalesHeader.GET(SalesHeader."Document Type"::"Blanket Order",OrderNumber) THEN BEGIN
        //                                            SalesHeader.INIT;
        //                                            SalesHeader."Document Type" := SalesHeader."Document Type"::"Blanket Order";
        //                                            SalesHeader."No." := OrderNumber;
        //                                            SalesHeader.INSERT(TRUE);
        //                                          END;
        //                                          SalesHeader.VALIDATE("Sell-to Customer No.",CustomerNumber);
        //  
        //                                          SalesHeader.MODIFY(TRUE);
        //                                        END;
        //  
        //                           Target=InsertBlanketOrderHeader(PROCEDURE 1100267003) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF SalesLine.GET(SalesLine."Document Type"::"Blanket Order",OrderNumber,LineNumber) THEN
        //                                            SalesLine.DELETE(TRUE);
        //  
        //                                          SalesLine.INIT;
        //                                          SalesLine."Document Type" := SalesLine."Document Type"::"Blanket Order";
        //                                          SalesLine."Document No." := OrderNumber;
        //                                          SalesLine."Line No." := LineNumber;
        //                                          SalesLine.INSERT(TRUE);
        //                                          SalesLine.VALIDATE(Type,SalesLine.Type::Item);
        //                                          SalesLine.VALIDATE("No.",'YEARLY');
        //                                          SalesLine.VALIDATE(Quantity,1);
        //                                          SalesLine.VALIDATE("Qty. to Ship",0);
        //                                          SalesLine.VALIDATE("Shipment Date",WORKDATE);
        //  
        //                                          SalesLine.MODIFY(TRUE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          IF NOT SalesLine.GET(SalesLine."Document Type"::"Blanket Order",OrderNumber,LineNumber) THEN BEGIN
        //                                            SalesLine.INIT;
        //                                            SalesLine."Document Type" := SalesLine."Document Type"::"Blanket Order";
        //                                            SalesLine."Document No." := OrderNumber;
        //                                            SalesLine."Line No." := LineNumber;
        //                                            SalesLine.INSERT(TRUE);
        //                                          END;
        //                                          #9..15
        //                                        END;
        //  
        //                           Target=InsertBlanketOrderLine(PROCEDURE 1100267005) }
        //      { Insertion         ;Target=Simulator(PROCEDURE 1100267004);
        //                           InsertAfter=OrderCounter(Variable 1100267010);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InvoiceCounter@1100267012 : Integer;
        //                           }
        //                            }
        //      { Insertion         ;Target=Simulator(PROCEDURE 1100267004);
        //                           InsertAfter=SubscriptionQtytoShipCalc(Variable 1100267009);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             SalesPost@1100267011 : Codeunit "Sales-Post";
        //                             SubscriptionNextPeriodeCalc@1100267013 : Codeunit "Subscription Next Periode Calc";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          StartingDate := DMY2DATE(1,1,2018);
        //                                          NumberOfDays := 10;
        //  
        //                                          OrderCounter := 0;
        //                                          DateCounter := StartingDate;
        //                                          FOR i := 1 TO NumberOfDays DO BEGIN
        //                                            DateCounter := CALCDATE('<1D>',DateCounter);
        //                                            WORKDATE := DateCounter;
        //  
        //                                            // Do what you have to do today
        //                                            // REPORT 296 Batch Post Sales Orders
        //                                            // CODEUNIT Subscription Next Periode Calc
        //                                            // CODEUNIT Subscription Qty to Ship Calc
        //  
        //                                            Day := DATE2DMY(DateCounter,1);
        //                                            Month := DATE2DMY(DateCounter,2);
        //                                            Year := DATE2DMY(DateCounter,3);
        //  
        //                                            // Convert Blanket Sales Orders to Order
        //                                            SalesHeader.RESET;
        //                                            SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::"Blanket Order");
        //                                            SalesHeader.SETRANGE("Document Date",WORKDATE);
        //                                            IF SalesHeader.FINDFIRST THEN
        //                                              REPEAT
        //                                                SubscriptionQtytoShipCalc.RUN(SalesHeader);
        //                                                BlanketSalesOrderToOrder.RUN(SalesHeader);
        //                                                MESSAGE('Order Created for Blanket Order %1',SalesHeader."No.");
        //                                                OrderCounter := OrderCounter + 1;
        //                                              UNTIL SalesHeader.NEXT = 0;
        //  
        //  
        //                                            IF Day = 1 THEN BEGIN
        //  
        //                                            END;
        //  
        //                                          END;
        //                                          MESSAGE('Simulation ran for %1 days and handled %2 contracts. Last date %3',i,OrderCounter, WORKDATE);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..4
        //                                          InvoiceCounter := 0;
        //                                          #5..9
        //                                          #15..18
        //                                          END;
        //                                          MESSAGE('Simulation ran for %1 days, handled %2 contracts and invoiced %3 orders. Last date %4',i,OrderCounter,InvoiceCounter,WORKDATE);
        //                                        END;
        //  
        //                           Target=Simulator(PROCEDURE 1100267004) }
        //      { Insertion         ;ChangedElements=PROCEDURECollection
        //      {
        //        LOCAL PROCEDURE InsertLocation@1100267006(LocationCode@1100267001 : Code[10];LocationName@1100267002 : Text[50]);
        //        VAR
        //          Location@1100267000 : Record Location;
        //        BEGIN
        //          IF NOT Location.GET(LocationCode) THEN BEGIN
        //            Location.INIT;
        //            Location.Code := LocationCode;
        //            Location.INSERT(TRUE);
        //          END;
        //          Location.Name := LocationName;
        //          Location.MODIFY(TRUE);
        //        END;
        //  
        //      }
        //       }
        //      { Deletion          ;Target=ItemSubscriptionRecurring(Variable 1100267001);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             ItemSubscriptionRecurring@1100267001 : Integer;
        //                           }
        //                            }
        //      { Insertion         ;ChangedElements=VariableCollection
        //      {
        //        ItemInvoicingType@1100267001 : Integer;
        //      }
        //       }
        //      { PropertyModification;
        //                           Property=Name;
        //                           OriginalValue=Subscription DemoData;
        //                           ModifiedValue=Recurring Invoicing DemoData }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=SUBS1.01;
        //                           ModifiedValue=SUBS1.03 }
        //    }
        //    CODE
        //    {
        //  
        //      BEGIN
        //      END.
        //    }
        //  }
        //  
        //  

    end;
}

