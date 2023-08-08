import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:telkom_career/domain/model/request/add_education/add_education.dart';
import 'package:telkom_career/presentation/pages/add_education/cubit/education_cubit.dart';

class InputEducation extends StatefulWidget {
  const InputEducation({super.key});

  @override
  State<InputEducation> createState() => _InputEducationState();
}

class _InputEducationState extends State<InputEducation> {
  bool _isEducation = false;

  final TextEditingController _level = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _major = TextEditingController();
  final TextEditingController _currentlyEducation = TextEditingController();
  final TextEditingController _dateSelectedStart = TextEditingController();
  final TextEditingController _dateSelectedFinished = TextEditingController();
  final TextEditingController _additionalInformation = TextEditingController();

  Image iconCurrentlyEducation() {
    if (_isEducation) {
      _currentlyEducation.text = "Tidak";
      return Image.asset("assets/icons/toggle-off.png");
    } else {
      _currentlyEducation.text = "Ya";
      return Image.asset("assets/icons/toggle-on.png");
    }
  }

  void currentlyEducationOnClick() {
    setState(() {
      _isEducation = !_isEducation;
    });
  }

  void showMoreStage() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.4,
            minChildSize: 0.17,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, top: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _level.text = "SMA/SMK";
                              });
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "SMA/SMK",
                              style: TextStyle(
                                  fontFamily: "inter_semibold",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _level.text = "D3";
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "D3",
                            style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333)),
                          ),
                        )
                      ]),
                      const SizedBox(height: 24),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _level.text = "S1";
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "S1",
                            style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333)),
                          ),
                        )
                      ]),
                      const SizedBox(height: 24),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _level.text = "S2";
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "S2",
                            style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333)),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          elevation: 0.5,
          leading: GestureDetector(
            onTap: () {
              context.go("/profileblank");
            },
            child: const Icon(Icons.arrow_back_ios_rounded,
                color: Color(0xff333333)),
          ),
          title: const Text('Pendidikan'),
          titleTextStyle: const TextStyle(
              fontFamily: 'inter_semibold',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff333333)),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
            color: Colors.grey[100],
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text("Jenjang",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)))),
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 3, 15, 0),
                    child: TextFormField(
                        cursorColor: const Color(0xff333333),
                        controller: _level,
                        style: const TextStyle(
                          fontFamily: "inter_regular",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                        decoration: InputDecoration(
                          hintText: "Jenjang",
                          suffixIcon: IconButton(
                              onPressed: showMoreStage,
                              icon:
                                  Image.asset("assets/icons/chevron-down.png")),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff666666),
                          )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                        ))),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text("Nama Universitas/Institusi",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)))),
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 3, 15, 0),
                    child: TextFormField(
                      cursorColor: const Color(0xff333333),
                      controller: _name,
                      style: const TextStyle(
                        fontFamily: "inter_regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff333333),
                      ),
                      decoration: InputDecoration(
                        hintText: "Nama Universitas/Institusi",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff666666),
                        )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                      ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text("Jurusan",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)))),
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 3, 15, 0),
                    child: TextFormField(
                      cursorColor: const Color(0xff333333),
                      controller: _major,
                      style: const TextStyle(
                        fontFamily: "inter_regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff333333),
                      ),
                      decoration: InputDecoration(
                        hintText: "Jurusan",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff666666),
                        )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                      ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text("Masih Dalam Pendidikan",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)))),
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 3, 15, 0),
                    child: TextFormField(
                        cursorColor: const Color(0xff333333),
                        controller: _currentlyEducation,
                        readOnly: true,
                        style: const TextStyle(
                          fontFamily: "inter_regular",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: currentlyEducationOnClick,
                              icon: iconCurrentlyEducation()),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff666666),
                          )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                        ))),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text("Mulai Pendidikan",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)))),
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 3, 15, 0),
                    child: TextFormField(
                        cursorColor: const Color(0xff333333),
                        controller: _dateSelectedStart,
                        readOnly: true,
                        style: const TextStyle(
                          fontFamily: "inter_regular",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                        decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1945),
                                    lastDate: DateTime(2100));
                                if (pickedDate != null) {
                                  String dateFormat = DateFormat("dd/MM/yyyy")
                                      .format(pickedDate);
                                  _dateSelectedStart.text = dateFormat;
                                }
                              },
                              icon: Image.asset("assets/icons/calendar.png")),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff666666),
                          )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                        ))),
                Visibility(
                    visible: (_isEducation ? true : false),
                    child: Column(children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 16),
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 16),
                          child: const Text("Selesai Pendidikan",
                              style: TextStyle(
                                  fontFamily: "inter_semibold",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333)))),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 3, 15, 0),
                        child: TextFormField(
                          cursorColor: const Color(0xff333333),
                          controller: _dateSelectedFinished,
                          readOnly: true,
                          style: const TextStyle(
                            fontFamily: "inter_regular",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff333333),
                          ),
                          decoration: InputDecoration(
                            hintText: "DD/MM/YYYY",
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1945),
                                      lastDate: DateTime(2100));
                                  if (pickedDate != null) {
                                    String dateFormat = DateFormat("dd/MM/yyyy")
                                        .format(pickedDate);
                                    _dateSelectedFinished.text = dateFormat;
                                  }
                                },
                                icon: Image.asset("assets/icons/calendar.png")),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff666666),
                            )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            fillColor: const Color(0xffFFFFFF),
                            filled: true,
                          ),
                        ),
                      )
                    ])),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text("Informasi Tambahan",
                        style: TextStyle(
                            fontFamily: "inter_semibold",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333)))),
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 3, 15, 0),
                    child: TextFormField(
                      cursorColor: const Color(0xff333333),
                      controller: _additionalInformation,
                      maxLines: 7,
                      minLines: 5,
                      style: const TextStyle(
                        fontFamily: "inter_regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff333333),
                      ),
                      decoration: InputDecoration(
                        hintText: "Informasi Tambahan",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff666666),
                        )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                      ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.multiline,
                    )),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<EducationCubit>(context).onAddEducation(
                        UpdateEducationRequest(
                            level: _level.text,
                            name: _name.text,
                            major: _major.text,
                            stillEducation: _currentlyEducation.text,
                            startEducation: _dateSelectedStart.text,
                            endEducation: _dateSelectedFinished.text,
                            description: _additionalInformation.text));
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 100, 15, 21),
                      child: ElevatedButton(
                          onPressed: () => context.go('/experience'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffEA232A),
                            padding:
                                const EdgeInsets.fromLTRB(146, 12, 146, 12),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.go("/profileblank");
                            },
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                fontFamily: "inter_bold",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ))),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
