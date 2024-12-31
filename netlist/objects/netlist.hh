#ifndef NETLIST_HH
#define NETLIST_HH

#include <iostream>
#include <vector>
#include <map>
#include <set>

class ports
{
    private:
        std::vector<std::string> all_ports;
        std::map<std::string,std::pair<int,int>> input_ports;
        std::map<std::string,std::pair<int,int>> output_ports;

    public:
        ports(const std::string& port_name,const std::string& direction, int start, int end)
        {
            if(direction=="input")
            {
                input_ports[port_name]={end,start};
            }
            else{
                output_ports[port_name]={end,start};
            }
        }

};
class wire
{
    private:
        std::set<std::string> nets;
    
    public:
        wire(const std::string& net){
            nets.insert(net);
        }

};
class instance 
{

};
// class netlist
// {
//     private:
//         std::vector<Modules* > modules;

// };

#endif