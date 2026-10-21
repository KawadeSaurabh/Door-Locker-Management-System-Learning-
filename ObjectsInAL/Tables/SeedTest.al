table 50457 "Seed Selection Test"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(2; "Seed Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Seed Master"."Seed Code";
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}