page 50468 "Department List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Department;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; NameSource)
                {

                }
            }
        }
    }
}