#ifndef UTIL_HH
#define UTIL_HH

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <nlohmann/json.hpp>
    
    class port
    {
        private:
            std::map<std::string,std::string> ports_info;

        public:
            void addPortInfo(const std::string& port_name, const std::string& info) {
                // std::cout << "port added-------------" << port_name << info << std:: endl;
                ports_info[port_name] = info;
            }

            std::string getPortInfo(const std::string& port_name) const {
                auto it = ports_info.find(port_name);
                if (it != ports_info.end()) {
                    return it->second;
                } else {
                    return "No information available for this port.";
                }
            }

            // Method to display all port information
            void displayPortInfo() const {
                std::cout << "port information-------------";
                for (const auto& [port_name, info] : ports_info) {
                    std::cout << "Port: " << port_name << " - Info: " << info << std::endl;
                }
            }
    };

    class wires
    {
        private:
            std::string wire_name;
            std::vector<std::string >wire_list;

        public:
             void addwire(const std::string& wire_name ){
                this->wire_name= wire_name;

                wire_list.push_back(wire_name);
               
            }
    };
    class Modules:public port ,public wires
    {
        private:
            std::string module_name;
            std::vector<std::string >ports_list;
            std::vector<std::string >wires_list;


        public:
            Modules(const std::string& module){
                this->module_name = module;

                /* std::cout << "module name printes ->" <<module_name << std::endl; */

            }
            void addports(const std::string& port)
            {
                addPortInfo(port,"input");
                ports_list.push_back(port);
            }

              void addWire(const std::string& wire)
            {
                addwire(wire);
                wires_list.push_back(wire);
            }
            void displayPorts() const {
                displayPortInfo();
                std::cout << "Ports for module " << module_name << ":" << std::endl;
            
                for (const auto& port : ports_list) {
                    std::cout << port << std::endl;
                }
                std:: cout << "***************" << std:: endl;
            }

        std::string getModuleName() const {  // Getter for module_name
            return module_name;
        }
        nlohmann::json toJson() const {
        nlohmann::json j;
        j["module_name"] = module_name;
        j["ports"] = ports_list;
        j["wires/nets"]= wires_list;
        return j;
    }
    };


#endif