# afj-assignment-03
Assignment (3) for AFJ class SS 2016

Assignment [file](https://github.com/Kyslik/afj-assignment-03/blob/master/assignment3.pdf).

---

BracketyWord program [(main.cpp)](https://github.com/Kyslik/afj-assignment-03/blob/master/BracketyWord/main.cpp) generates brackety words for flex. Its purpose is simply generate "manual work"; see below:

```
vector<string> key_words({"begin", "end"});
```

outputs (string): 


>[Bb][Ee][Gg][Ii][Nn] {t(0); return KWBEGIN;}  
[Ee][Nn][Dd] {t(0); return KWEND;}

Please note:  
>that [**KWBEGIN**](https://github.com/Kyslik/afj-assignment-03/blob/master/assignment-3/assignment-3.l#L3) && [**KWEND**](https://github.com/Kyslik/afj-assignment-03/blob/master/assignment-3/assignment-3.l#L4) is defined in `*.l` file  
that function [`t(int i)`](https://github.com/Kyslik/afj-assignment-03/blob/master/assignment-3/assignment-3.l#L56) is also declared in `*.l` file.

---
