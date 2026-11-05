table 50461 Department
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Department Name"; text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Department Code")
        {
            Clustered = true;
        }
    }
}