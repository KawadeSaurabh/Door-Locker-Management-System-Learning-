page 50466 "Employee ListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Emp_Details;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}