class PLUGIN {
	class init {
		file = QPLUGIN_PATHFILES;
		class setParams {postInit = 1;};
		class postInit {postInit = 1;};
	};
	class menus {
		file = QPLUGIN_PATHFILE(menus);
		class menu {};
	};
};