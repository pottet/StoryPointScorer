import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:turksat/pages/admin_dashboard.dart';
import 'package:turksat/pages/user_main.dart';

import '../modals/user_modal.dart';

class adminPage extends StatefulWidget {
  const adminPage({Key? key}) : super(key: key);
  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  String username = "Admin";
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  bool? _popupBuilderSelection = false;




  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
      selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>  userPage()
          ));
        },
            child: Text(username)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.teal[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      getHTTP();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => dashBoard()));
                    },
                    child: Container(
                        height:MediaQuery.of(context).size.height*0.05 ,
                        width: MediaQuery.of(context).size.width*0.99,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(5)),
                      child: Text("Show Dashboard",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 26,
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  SizedBox(height: 80),

                  Text("Task Configurations", style: TextStyle(
                    fontSize: 24,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold
                  ),
                    textAlign: TextAlign.center),

                  SizedBox(height: 50),

                /*  TextField(
                    decoration: InputDecoration(
                        hoverColor: Colors.green,
                        hintText: "Task Name",
                        hintStyle: TextStyle(color: Colors.blueGrey ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                        )
                    ),
                  ),*/

                 TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.blue)),
                          hintText: "Task Name"),
                    ),

                  SizedBox(height: 30),

                  DropdownSearch<String>.multiSelection(
                    clearButtonProps: ClearButtonProps(isVisible: false),
                    items: ["Ayşe", "Mehmet", "Fatma", "Funda", "Mahmut", "Mahmut", "Mahmut"],
                  ),

                  SizedBox(height: 30),

                  DropdownSearch<int>.multiSelection(
                    items: [1, 2, 5, 13],
                  ),


               /*   Row(
                    children: [
                      Expanded(
                        child: DropdownSearch<int>.multiSelection(
                          items: [1, 2, 5, 13],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Expanded(
                        child: DropdownSearch<String>.multiSelection(
                          clearButtonProps: ClearButtonProps(isVisible: true),
                          items: ["Ayşe", "Mehmet", "Fatma", "Funda", "Mahmut"],
                        ),
                      )
                    ],
                  ),*/

                  /*Expanded(
                    child: DropdownSearch<UserModel>(
                      asyncItems: (String? name) => getData(name),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSelectedItems: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        showSearchBox: true,
                      ),
                      compareFn: (item, sItem) => item.id == sItem.id,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: 'User *',
                          filled: true,
                          fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                    ),
                  ),*/
                  SizedBox(height: 290,),
                ],
              ),
            ),
          ),
      ),


        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton.extended(
        label: Text("Create Task"),
        onPressed: () {
          getHTTP();
        },
        backgroundColor: Colors.indigo,
    )
    );
  }

  Widget _buildTask()
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width*0.5,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              blurStyle: BlurStyle.inner,
              offset: Offset(3, 5), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Row(
        children: [
          Container(
            child: Text("Task Name", style: TextStyle(
              fontSize: 16,
            ),
              textAlign: TextAlign.center,
            ),
            width: MediaQuery.of(context).size.width*0.3,
            decoration: BoxDecoration(),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.025,
            color: Colors.black54,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.575,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }

  void getHTTP() async{
    try {
      var response = await Dio().get(
          "http://10.0.2.2:8082/api/task");
      print(response);
    }
    catch(e)
    {
      print(e);
    }
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context,
      UserModel? item,
      bool isSelected,
      ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        leading: CircleAvatar(
        ),
      ),
    );
  }


  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "http://10.0.2.2/api/user",
      queryParameters: {"name": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }
    return [];
  }
}
