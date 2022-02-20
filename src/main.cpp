#include <QCoreApplication>
#include <pybind11/embed.h>
#include <iostream>
namespace py = pybind11;
using namespace std;
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    cout << "[C++] call" << endl;
    try {
        py::scoped_interpreter guard{};

        py::exec(R"(
        print('='*20)
        print("[python39] call")
        )");
        py::module os = py::module::import("os");
        py::exec(R"(
        import os
        print("os name: " + os.name)
        print("7*7 = " + str(7*7))

        print('='*20)
        )");
    }
    catch (py::error_already_set const &pythonErr) {std::cout << pythonErr.what();}

    cout << "[C++] call again" << endl;

    return a.exec();
}
