void main()
{
    var x = {
      "employee": {
        "name":       "sonoo",
        "salary":      56000,
        "married":    true
      }
    };

    DeepSearchByKey(key: "salary", object: x);
}

void DeepSearchByKey({required String key, required Map object})
{
  for(var _key in object.keys)
  {
    if(_key == key)
    {
      print("found");
    }
    else
    {
      DeepSearchByKey(key: key, object: object[_key]);
    }
  }
}
