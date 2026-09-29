page 50457 "Door Loc Master Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Door Loc Master T";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(LockerCode; Rec.LockerCode)
                {
                    ApplicationArea = All;
                }
                field(LockerName; Rec.LockerName)
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field(AvailableQty; Rec.AvailableQty)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Ratings; Rec.Ratings)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TestField)
            {
                Caption = 'Use of TestField';
                trigger OnAction()
                begin
                    Rec.TestLockerAvailability();
                end;
            }

            action(TestErrorField)
            {
                Caption = 'Use of TestErrorField';
                trigger OnAction()
                begin
                    Rec.TestFieldError();
                end;
            }

            action(SellLocker)
            {
                Caption = 'Sell Locker';
                trigger OnAction()
                begin
                    Rec.SellLocker();
                end;
            }

            action(TestProcedure)
            {
                Caption = 'Test Procedure';

                trigger OnAction()
                begin
                    Rec.TestProcedure();
                end;
            }

            action(TestingProcedure)
            {
                Caption = 'Testing Procedure';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestingProcedure();
                end;
            }

            action(TestCalReturn)
            {
                Caption = 'Return Result';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestingCalculateLockerValue();
                end;
            }

            action(DiscountActiom)
            {
                Caption = 'Return Discount';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CheckDiscount();
                end;
            }

            action(PassingRecord)
            {
                Caption = 'Passing Record';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TestRecord();
                end;
            }
        }
    }
}