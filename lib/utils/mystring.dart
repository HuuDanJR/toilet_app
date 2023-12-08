class MyString{
    static const int DEFAULTNUMBER = 111111;
    static const String ADRESS_LOCAL = "localhost";
		static const String ADRESS_SERVER = "30.0.0.53";
    static const String BASE = 'http://$ADRESS_LOCAL:8090/api/';
    static const String BASEURL = 'http://localhost:8090';
    // static const String BASEURL = 'http://30.0.0.53:8090';

     static const String list_ranking = '${BASE}list_ranking';
     static const String create_ranking = '${BASE}add_ranking';
     static const String update_ranking = '${BASE}update_ranking';
     static const String delete_ranking = '${BASE}delete_ranking';
     static const String delete_ranking_all_and_add = '${BASE}delete_ranking_all_create_default';
}