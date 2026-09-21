page 50451 "Door Locker Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Door Locker Master";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Locker Code"; Rec."Locker Code")
                {
                    ApplicationArea = All;
                }
                field("Locker Name"; Rec."Locker Name")
                {
                    ApplicationArea = All;
                }
                field("Locker Type"; Rec."Locker Type")
                {
                    ApplicationArea = All;
                }
                field(Material; Rec.Material)
                {
                    ApplicationArea = All;
                }
                field(Size; Rec.Size)
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field(StockInformation; StockInformation)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Test Locker")
            {
                ApplicationArea = All;
                Caption = 'Test Locker';
                trigger OnAction()
                var
                    LockerRec: Record "Door Locker Master";
                begin
                    // 1. Get()
                    LockerRec.Get(Rec."Locker Code");

                    Message('GET() Result:\Locker Code: %1\Locker Name: %2',
                    LockerRec."Locker Code",
                    LockerRec."Locker Name");

                    // 2. Reset the variable
                    LockerRec.Reset();

                    // 3. FindFirst()
                    if LockerRec.FindFirst() then
                        Message('FINDFIRST() Result:\Locker Code: %1\Locker Name: %2',
                        LockerRec."Locker Code",
                        LockerRec."Locker Name");

                    // 4. Apply a filter
                    LockerRec.SetRange(Status, LockerRec.Status::Available);

                    // 5. Find the first record matching the filter\
                    if LockerRec.FindFirst() then
                        Message('SETRANGE() + FINDFIRST() Result:\Locker Code: %1\Locker Name: %2',
                        LockerRec."Locker Code",
                        LockerRec."Locker Name");

                    // 6. Remove the filter
                    LockerRec.Reset();

                    Message('RESET() executed. All filters are removed.');
                end;
            }

            action(TestGet)
            {
                ApplicationArea = All;
                Caption = 'Test Get';

                trigger OnAction()
                var
                    LockerRec: Record "Door Locker Master";
                begin
                    LockerRec.Get('LOCK002');

                    LockerRec.Price := 900;

                    LockerRec.Modify();

                    Message(
                        'Locker: %1\Price: %2\Quantity: %3',
                        LockerRec."Locker Name",
                        LockerRec.Price,
                        LockerRec."Available Quantity"
                        );
                end;
            }

            action(ApplyDiscount)
            {
                ApplicationArea = All;
                Caption = 'Apply Discount';

                trigger OnAction()
                begin
                    Rec.ApplyDiscount();
                end;
            }

            action(AddStock)
            {
                Caption = 'Add Stock';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec."Available Quantity" := Rec."Available Quantity" + 5;

                    Rec.UpdateStatus();

                    if Rec."Available Quantity" > 0
                    then
                        StockInformation := 'Stock Available.'
                    else
                        StockInformation := 'No Stock Available.';

                    // CurrPage.Update();
                end;
            }

            action(ShowAvailableQty)
            {
                Caption = 'Show Available Qty';
                ApplicationArea = All;

                trigger OnAction()
                var
                    locRec: Record "Door Locker Master";
                begin
                    locRec.ShowAvailableLockers();
                end;
            }

            action(TestNext)
            {
                Caption = 'Test Next()';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestNext();
                end;
            }

            action(TestFindLast)
            {
                Caption = 'Test FindLast()';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestFindLast();
                end;
            }

            action(TestFind)
            {
                Caption = 'Test find()';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestFind();
                end;
            }

            action(RecordBufferConcept)
            {
                ApplicationArea = All;
                Caption = 'Record Buffer Concept';

                trigger OnAction()
                begin
                    Rec.RecordBufferConcept();
                end;
            }

            action(IsEmptyAndCount)
            {
                ApplicationArea = All;
                Caption = 'IsEmpty() And Count()';
                trigger OnAction()
                begin
                    Rec.TestIsEmpty();
                    Rec.TestCount();
                end;
            }

            action(TestSetRange)
            {
                Caption = 'Test SetRange()';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestSetRange();
                end;
            }

            action(TestSetFilter)
            {
                ApplicationArea = All;
                Caption = 'Test SetFilter()';

                trigger OnAction()
                begin
                    Rec.TestSetFilter();
                end;
            }

            action(TestGetRange)
            {
                Caption = 'Test GetRange()';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestGetRange();
                end;

            }

            action(SetCurrKey)
            {
                Caption = 'SetCurrentKey()';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Lets start');
                end;
            }
        }
    }

    var
        StockInformation: Text[50];

    var
        ProcessingMessage: Text[100];

    var
        ProcessedQuantity: Integer;
}