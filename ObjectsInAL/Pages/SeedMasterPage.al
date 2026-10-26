page 50459 "Seed Master"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seed Master";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Seed Code"; Rec."Seed Code")
                {
                    ApplicationArea = All;
                }
                field("Seed Name"; Rec."Seed Name")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("QC Test Count"; Rec."QC Test Count")
                {
                    ApplicationArea = All;
                    // DrillDown = true;
                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(ShowQCTests)
            {
                Caption = 'Show QC Tests';
                ApplicationArea = All;
                Image = View;

                trigger OnAction()
                begin
                    Rec.ShowQCTests();
                end;
            }

            action(ReadSeedPermissionDemo)
            {
                Caption = 'Test Seed Read Permission';
                ApplicationArea = All;
                Image = View;

                trigger OnAction()
                var
                    SeedPermissionDemo: Codeunit "Seed Permission Demo";
                begin
                    SeedPermissionDemo.ReadSeed();
                end;
            }

            action(TestSeedNameSorting)
            {
                Caption = 'Test QC Test Count';
                ApplicationArea = All;
                Image = SortAscending;

                trigger OnAction()
                var
                    Seed: Record "Seed Master";
                begin
                    Seed.TestQCTestCount();
                end;
            }
            action(TestQCFilters)
            {
                ApplicationArea = All;
                Caption = 'Test QC filters';

                trigger OnAction()
                begin

                end;
            }
        }
    }
}