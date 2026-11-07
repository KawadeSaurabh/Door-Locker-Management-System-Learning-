page 50469 "Employee_List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Emp_Details;

    layout
    {
        area(Content)
        {
            repeater(General)
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