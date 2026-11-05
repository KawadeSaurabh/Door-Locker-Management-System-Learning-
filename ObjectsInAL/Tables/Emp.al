table 50462 Emp_Details
{
    fields
    {
        field(1; "Employee No."; Code[20])
        {
        }
        field(2; "Employee Name"; Text[50])
        {
        }
        field(3; "Department Code"; Code[20])
        {
            TableRelation = Department."Department Code";
        }
    }

    keys
    {
        key(PK; "Employee No.")
        {
            Clustered = true;
        }
    }
}