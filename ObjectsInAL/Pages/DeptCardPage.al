page 50467 "Departments Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Department;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                }

                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                }
            }

            part(EmployeeList; "Employee ListPart")
            {
                ApplicationArea = All;
                SubPageLink = "Department Code" = field("Department Code");
            }
        }
    }
}