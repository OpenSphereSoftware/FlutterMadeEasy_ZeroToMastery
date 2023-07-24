

void main(){

int nonNullable = 10; // This value cannot be null 
int? nullableInt = null; // This value can be null
// nullableInt = 10;

late String description; 
description = 'description'; // initialized

int value = nullableInt!; // non null assertion operator  ensures dart this is not null by time of running

int value2 = nullableInt ?? 1; // 1 is used in case of nullableInt is null

String? nullableString = null; 
int stringLength = nullableString?.length ?? 0; // if nullableString is nulll, stringLength is set to default 0

}