page 50459 "Seed Master"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seed Master";
    CardPageId = "Seed Card Page";

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
            action(TestLotFlowFilters)
            {
                ApplicationArea = All;
                Caption = 'Test QC filters';
                Image = TestFile;

                trigger OnAction()
                var
                    Seed: Record "Seed Master";
                begin
                    Seed.TestLotFlowFilter();
                end;
            }

            action(TestInitAndClear)
            {
                Caption = 'Test Init and Clear';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Seed: Record "Seed Master";
                begin
                    if not Seed.FindFirst() then
                        Error('No seed record found.');
                    Seed.Init();
                    Seed.Modify();

                    Message('Record modified. Check the seed list');

                end;
            }
        }
    }
}