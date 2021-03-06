//
//  main.cpp
//  BracketyWord
//
//  Created by Martin Kiesel on 27/04/16.
//  Copyright © 2016 Martin Kiesel. All rights reserved.
//

#include <iostream>
#include <string>
#include <vector>

void generate(std::vector<std::string> &in_words, const std::string &prefix, const std::string &type = "0");

int main(void)
{
    using std::vector;
    using std::string;

    vector<string> key_words({
                        "begin", "end", "if", "then", "while", "do",
                        "procedure", "function", "integer", "real", "boolean",
                        "type", "var", "array", "of", "record"});

    vector<string> operators({"mod", "and", "or", "not"});

    vector<string> booleans({"true", "false"});

    generate(key_words, "KW");
    generate(operators, "O");
    generate(booleans, "", "CONSTBOOL");

    return 0;
}

void generate(std::vector<std::string> &in_words, const std::string &prefix, const std::string &type)
{
    using std::string;

    std::cout << "Generating " << in_words.size() << " words with prefix: " << prefix << ", type: " << type << std::endl;
    for (auto &key_word : in_words)
    {
        string out = "";
        std::transform(key_word.begin(), key_word.end(), key_word.begin(), toupper);

        for(char& c : key_word)
        {
            char lower = static_cast<char>(tolower(c));
            out += "[";
            out += c;
            out += lower;
            out += "]";
        }
        out += " {t(" + type + "); return " + prefix + key_word + ";}";
        std::cout << out << std::endl;
    }

    std::cout << std::endl << std::endl;
}