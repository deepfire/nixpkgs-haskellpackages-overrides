pkgs: haskellPackagesOrig:
let haskell = pkgs.haskell;
in
haskellPackagesOrig.override (oldArgs: {
  overrides = with haskell.lib; new: old:
  let parent = (oldArgs.overrides or (_: _: {})) new old;
  in parent // {
      # aeson          = (doJailbreak old.aeson);
      aeson          = dontCheck (haskell.lib.overrideCabal old.aeson (oldAttrs: {
        buildDepends = [ new.fail new.tagged ];
        editedCabalFile = null;
        revision        = null;
        src = pkgs.fetchgit {
                url    = https://github.com/bos/aeson;
                rev    = "d9f1ad357e5dc28c381099814e7cce0e68cf2b6a";
                sha256 = "0nzajw4ia2s7kjjygw9xddrfa1aq2kq960bm9wgj8b34manmyh0f";
        };
      }));
      aeson-utils      = (doJailbreak old.aeson-utils);
      authenticate-oauth = dontCheck (doJailbreak old.authenticate-oauth);
      bifunctors     = dontCheck (doJailbreak old.bifunctors);
      # 'conduit' tests go OOM on GHC 8.0.1-rc2
      conduit        = dontCheck old.conduit;             # XXX: running tests triggers OOM
      # 'conduit-combinators' tests go OOM on GHC 8.0.1-rc2
      conduit-combinators =
                       dontCheck old.conduit-combinators; # XXX: running tests triggers OOM
      # newer 'comonad' required by new 'pointed'
      comonad        = dontCheck (haskell.lib.overrideCabal old.comonad (oldAttrs: {
        src = pkgs.fetchgit {
                url    = https://github.com/ekmett/comonad.git;
                rev    = "4ed802746b623a8705d08d90cd57b859d7bc70e2";
                sha256 = "1n9ggd51iykqz55wn76wpibxrpmxymjkly1swfpab36mfb4lr7s8";
        };
      }));
      doctest        = dontCheck (haskell.lib.overrideCabal old.doctest (oldAttrs: {
        buildDepends = [ new.base-compat ];
        src = pkgs.fetchgit {
                url    = https://github.com/deepfire/doctest;
                rev    = "167fa799be1f642d388c750b03a188d9096e03a2";
                sha256 = "06myafhfhgmvrcfgi7vp27cnwg83119pdjd9hsc03kz1hd0pqwv7";
        };
      }));
      fail           = dontHaddock (dontCheck (doJailbreak old.fail));
      foldl          = dontHaddock (dontCheck (doJailbreak old.foldl));
      generic-aeson  = doJailbreak old.generic-aeson;
      haskell-src-exts        = dontCheck (haskell.lib.overrideCabal old.haskell-src-exts (oldAttrs: {
        src = pkgs.fetchgit {
                url    = https://github.com/haskell-suite/haskell-src-exts;
                rev    = "291cc802fda331e7fb69c57be77fc95aac7fb18c";
                sha256 = "05i4a0nsd4cv8waz5j4d2fr5a6kk23v2qfxc4y7vws1xgq6f71jb";
        };
      }));
      hflags        = haskell.lib.overrideCabal old.hflags (oldAttrs: {
        src = pkgs.fetchgit {
                url    = https://github.com/deepfire/hflags;
                rev    = "f4090a1131b7cb3ca0078fee2dc797ed8453f41a";
                sha256 = "1a3fl41sr34iz6cnygvngl2f88xxbpn5jhan6rqcxqsda86h6ri8";
        };
      });
      HTTP           =           (doJailbreak old.HTTP);
      http-date      = (dontCheck old.http-date);
      json-autotype  = (doJailbreak old.json-autotype);
      json-schema    = (doJailbreak old.json-schema);
      # newer 'kan-extensions' required for newer 'lens'
      kan-extensions = dontCheck (haskell.lib.overrideCabal old.kan-extensions (oldAttrs: {
        src = pkgs.fetchgit {
                url    = https://github.com/ekmett/kan-extensions.git;
                rev    = "99df306a69f91f6c36ac3e98a5f4a31b7c7ba6f4";
                sha256 = "0vd3z37a0bfsgkmisr917gd65g3jix4xpb11xyyyfl3xyac447gl";
        };
      }));
      # lens 4.13 depends on old doctest
      lens           = dontCheck (haskell.lib.overrideCabal old.lens (oldAttrs: {
        src = pkgs.fetchgit {
                url    = https://github.com/ekmett/lens.git;
                rev    = "64cce394ae9b1ee668892906beab15a97c900862";
                sha256 = "17j93h5c63psyc2y5wvhp89nighypskykgix3bw0l4kl6h5i18a3";
        };
      }));
      lens-aeson     = dontCheck (doJailbreak old.lens-aeson);
      # 'linear': doctests & stuff
      linear         = dontCheck (haskell.lib.overrideCabal old.linear (oldAttrs: {
        editedCabalFile = null;
        revision        = null;
        src = pkgs.fetchgit {
                url    = https://github.com/ekmett/linear.git;
                rev    = "7de2733b1d922a2717860df49b6090042b81ea35";
                sha256 = "0c3cw4b9cnypi1rjdyzp5xb0qy088q3mg5in8q5lcvqfmpzfc22b";
        };
      }));
      managed        = doJailbreak old.managed;
      monads-tf      = doJailbreak old.monads-tf;
      parsers        = doJailbreak old.parsers;
      # newer 'pointed' necessitated by newer 'kan-extensions'
      pointed       = dontCheck (haskell.lib.overrideCabal old.pointed (oldAttrs: {
        src = pkgs.fetchgit {
                url    = https://github.com/ekmett/pointed.git;
                rev    = "7fbe6a2283b64fcc4ae06e8a1c4d8923d45b6fbc";
                sha256 = "1209b5sc760wcms7qsyyhl3q3dia04j9bps79ksjrk4n6ijn05vy";
        };
      }));
      psqueues       = dontCheck (haskell.lib.overrideCabal old.psqueues (oldAttrs: {
        src = pkgs.fetchgit {
                url    = https://github.com/bttr/psqueues.git;
                rev    = "51a4721daec536c6c63d66958b893abe563df528";
                sha256 = "1qlg5h6j6fsal3lyql8bivbzqj56j5d1vvqi7as8fqvmvr4g22zf";
        };
      }));
      reducers       = doJailbreak old.reducers;
      resourcet      = doJailbreak old.resourcet;
      sdl2           = doJailbreak old.sdl2;
      semigroupoids  = dontCheck (doJailbreak old.semigroupoids);
      stm-conduit    = doJailbreak (dontCheck (haskell.lib.overrideCabal old.stm-conduit (oldAttrs: {
        src          = pkgs.fetchgit {
                url    = https://github.com/deepfire/stm-conduit.git;
                rev    = "dae89e18161026aca9ab095afca0a3d94dce4b96";
                sha256 = "0bmym2ps0yjcsbyg02r8v1q8z5hpml99n72hf2pjmd31dy8iz7v9";
        };
      })));
      th-expand-syns = doJailbreak old.th-expand-syns;
      transformers-compat
                     = doJailbreak (old.transformers-compat_0_5_1_4);
      trifecta       = doJailbreak old.trifecta;
      turtle         = doJailbreak old.turtle;
      optparse-generic = new.callPackage ({ mkDerivation, base, optparse-applicative, system-filepath, text, transformers, void }:
             mkDerivation {
               pname = "optparse-generic";
               version = "1.0.0";
               buildDepends = [ base optparse-applicative system-filepath text transformers void ];
               src = pkgs.fetchgit {
                 url    = https://github.com/Gabriel439/Haskell-Optparse-Generic-Library.git;
                 rev    = "d0a26abb9eb883bd9fff07773f5ce987a7215023";
                 sha256 = "1y76wmsr7pcfddgy26h4ra72c0l3fp01ck9j868qy9qxgbcnh6m0";
               };
               isLibrary = true;
               isExecutable = false;
               license = stdenv.lib.licenses.gpl3;
             }) {};
  };
})
