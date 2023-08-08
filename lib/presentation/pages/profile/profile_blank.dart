// ignore_for_file: non_constant_identifier_names, deprecated_member_use, unused_local_variable

part of '../pages.dart';

class ProfileBlank extends StatefulWidget {
  const ProfileBlank({super.key});

  @override
  State<ProfileBlank> createState() => _ProfileBlankState();
}

class _ProfileBlankState extends State<ProfileBlank> {
  final _formKey = GlobalKey<FormState>();
  late int _bottomNavCurrentIndext = 0;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  void ChoiceImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.2,
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
                      Image.asset("assets/icons/camera.png"),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          ChoiceImage(ImageSource.camera);
                        },
                        child: const Text(
                          "Ambil foto",
                          style: TextStyle(
                              fontFamily: "inter_bold",
                              fontSize: 16,
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Image.asset("assets/icons/galery.png"),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          ChoiceImage(ImageSource.gallery);
                        },
                        child: const Text(
                          "Pilih dari galeri",
                          style: TextStyle(
                              fontFamily: "inter_bold",
                              fontSize: 16,
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Image.asset("assets/icons/trash.png"),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          ChoiceImage(ImageSource.camera);
                        },
                        child: const Text(
                          "Hapus foto",
                          style: TextStyle(
                              fontFamily: "inter_bold",
                              fontSize: 16,
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isClose = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.05),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: const Text("Profile"),
          titleTextStyle: const TextStyle(
            fontFamily: "inter_semibold",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff333333),
          ),
          actions: [
            IconButton(
              onPressed: () => context.go('/profilesettings'),
              icon: Image.asset('assets/icons/setting.png'),
            ),
          ],
          elevation: 0.5,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        key: _formKey,
        child: Form(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.25,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: InkWell(
                                onTap: () {
                                  _showSelectPhotoOptions(context);
                                  setState(() {});
                                },
                                child: _imageFile == null
                                    ? const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/avatar.png"),
                                      )
                                    : CircleAvatar(
                                        backgroundImage:
                                            FileImage(File(_imageFile!.path)),
                                      )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: const Text(
                              "Bima Agustian Wanaputra",
                              style: TextStyle(
                                fontFamily: 'inter_semibold',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const Text(
                              "---",
                              style: TextStyle(
                                fontFamily: 'inter_semibold',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: const Text(
                              "Loremipsum@mail.com",
                              style: TextStyle(
                                fontFamily: 'inter_regular',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: const Text(
                              "---",
                              style: TextStyle(
                                fontFamily: 'inter_semibold',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: const Text(
                              "Sunting Profil",
                              style: TextStyle(
                                fontFamily: 'inter_semibold',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffEA232A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16, top: 8),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Pengalaman Kerja",
                                  style: TextStyle(
                                    fontFamily: "inter_semibold",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin:
                                    const EdgeInsets.only(top: 8, right: 15),
                                child: InkWell(
                                  onTap: () => context.go('/experience'),
                                  child: const Text(
                                    "Tambah",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "inter_semibold",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffEA232A),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 16),
                            child: const Text(
                              "Belum ada data dimasukkan",
                              style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff666666),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16, top: 8),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Pendidikan",
                                  style: TextStyle(
                                    fontFamily: "inter_semibold",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin:
                                    const EdgeInsets.only(top: 8, right: 15),
                                child: InkWell(
                                  onTap: () => context.go('//education'),
                                  child: const Text(
                                    "Tambah",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "inter_semibold",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffEA232A),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 16),
                            child: const Text(
                              "Belum ada data dimasukkan",
                              style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff666666),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 16, top: 8),
                            child: const Text(
                              "Kemampuan",
                              style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Belum ada data dimasukkan",
                                  style: TextStyle(
                                    fontFamily: "inter_semibold",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  onTap: () =>
                                      context.go('/profileinputability'),
                                  child: Image.asset(
                                    'assets/icons/icon_edit.png',
                                    color: const Color(0xff999999),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 16, top: 8),
                            child: const Text(
                              "Bahasa",
                              style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Belum ada data dimasukkan",
                                  style: TextStyle(
                                    fontFamily: "inter_semibold",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  onTap: () =>
                                      context.go('/profileinputlanguage'),
                                  child: Image.asset(
                                    'assets/icons/icon_edit.png',
                                    color: const Color(0xff999999),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 16, top: 8),
                            child: const Text(
                              "CV/Resume",
                              style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Belum ada data dimasukkan",
                                  style: TextStyle(
                                    fontFamily: "inter_semibold",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  child: Image.asset(
                                    'assets/icons/icon_edit.png',
                                    color: const Color(0xff999999),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 16, top: 8),
                            child: const Text(
                              "Portofolio",
                              style: TextStyle(
                                fontFamily: "inter_semibold",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Belum ada data dimasukkan",
                                  style: TextStyle(
                                    fontFamily: "inter_semibold",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  child: Image.asset(
                                    'assets/icons/icon_edit.png',
                                    color: const Color(0xff999999),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: const Color(0xffEA232A),
        unselectedItemColor: const Color(0xff999999),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontFamily: "inter_semibold",
          fontSize: 10,
          color: Color(0xffEA232A),
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: "inter_semibold",
          fontSize: 10,
          color: Color(0xff999999),
        ),
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndext = index;
          });
        },
        currentIndex: _bottomNavCurrentIndext,
        elevation: 0.05,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () => context.go('/beranda'),
              child: Image.asset(
                'assets/icons/beranda.png',
                color: const Color(0xff999999),
              ),
            ),
            activeIcon: Image.asset(
              'assets/icons/beranda.png',
              color: const Color(0xff999999),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () => context.go('/jobscreen'),
              child: Image.asset(
                'assets/icons/pekerjaan.png',
                color: const Color(0xff999999),
              ),
            ),
            // activeIcon: Image.asset(
            //   'assets/icons/pekerjaan.png',
            //   color: const Color(0xffEA232A),
            // ),
            label: 'Pekerjaan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/kegiatan.png',
              color: const Color(0xff999999),
            ),
            // activeIcon: Image.asset(
            //   'assets/icons/kegiatan.png',
            //   color: const Color(0xffEA232A),
            // ),
            label: 'Kegiatan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/notif.png',
              color: const Color(0xff999999),
            ),
            // activeIcon: Image.asset(
            //   'assets/icons/notif.png',
            //   color: const Color(0xffEA232A),
            // ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profil.png',
              color: const Color(0xffEA232A),
            ),
            activeIcon: Image.asset(
              'assets/icons/profil.png',
              color: const Color(0xffEA232A),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
