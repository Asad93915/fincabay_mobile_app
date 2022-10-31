
const String baseUrl="http://173.208.142.67:5955/fincabayapi/api/";
const String loginUrl=baseUrl + "accounts/login";
const String registerUrl=baseUrl + "accounts/Register";
const String allCitiesUrl=baseUrl + "Property/GetCities";
const String gatAllAreaUnitsUrl=baseUrl + "Property/GetAreaUnitByCategory?";
const String getAreaSizeViewUrl=baseUrl + "Property/PropertySearch?";
const String getPropertyTypeUrl=baseUrl + "Property/GetPropertyTypesByCategory?";
const String getLocNameUrl=baseUrl + "Property/GetAreaUnitByCityId/";
const String getLocPhasesUrl=baseUrl + "Property/GetLocationPhaseByAreaId/";
const String addPropertyUrl=baseUrl + "Property/AddPropertyWhileSignUp";
const String propSearchUrl=baseUrl+ "Property/PropertySearch?";
const String getUserPropUrl=baseUrl + "Property/GetPropertyByEmail?";


//Agents

const String agentAddPropUrl=baseUrl + "Agent/PropertyAddByAgent";
const String manageAgentPropUrl=baseUrl + "Agent/GetAgentPropertiesByAgentId?";
const String getStaffUrl=baseUrl + "Accounts/GetAllStaffMembersByAgentId?";
const String delStaffUrl=baseUrl + "Accounts/StaffUserDelete?";
const String editStaffUrl=baseUrl + "Accounts/UpdateStaffMember";