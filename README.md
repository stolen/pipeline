DEPRECATED
===============
Please use this maintained fork instead: https://github.com/choptastic/pipeline

Erlang Pipeline parse\_transform
=============================

What is it for
---------------------
Sometimes erlang programmer wants to apply function composition.
Usually it is done by ugly combining functions, e.g.

    Result = fun3(mod2:fun2(fun1(Arg1, Arg2))).

Other way to do that is creating multiple bindings:

    R1 = fun1(Arg1, Arg2),
    R2 = mod2:fun2(R1),
    Result = fun3(R2).

This pars\_transform allows to write like this:

    Result = [fun1, mod2:fun2, fun3] (Arg1, Arg2).

More complicated options are available -- see `src/pipeline_demo.erl` for examples.


Building and using pipeline
-----------------------
Building is made by rebar:

    ./rebar get-deps
    ./rebar compile

To use pipeline, simply compile target module with `{parse_transform, pipeline}` option.
