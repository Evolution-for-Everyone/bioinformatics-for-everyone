      seqfile = seqfile.txt   * sequence data filename
      
     *treefile = tree.H0.txt   * tree structure file for H0 in Table 3 [CHANGE THIS]
     *treefile = tree.H1.txt   * tree structure file for H1 in Table 3 [CHANGE THIS]
     *treefile = tree.H2.txt   * tree structure file for H2 in Table 3 [CHANGE THIS]
      treefile = tree.H3.txt   * tree structure file for H3 in Table 3 [CHANGE THIS]

      outfile = results_H3.txt   * main result file name

        noisy = 9      * 0,1,2,3,9: how much rubbish on the screen
      verbose = 1      * 1:detailed output
      runmode = 0      * 0:user defined tree

      seqtype = 1      * 1:codons
    CodonFreq = 2      * 0:equal, 1:F1X4, 2:F3X4, 3:F61

       *model = 0      * 0:one omega ratio for all branches          [CHANGE THIS]
        model = 2      * 2:user specified dN/dS ratios for branches  [CHANGE THIS]

      NSsites = 0      * 

        icode = 0      * 0:universal code

    fix_kappa = 0      * 1:kappa fixed, 0:kappa to be estimated
        kappa = 2      * initial or fixed kappa

    fix_omega = 0      * 1:omega fixed, 0:omega to be estimated 
        omega = 0.2    * initial omega

                       * comments:
                       * H0 in Table 3: model = 0
                       * H1 in Table 3: model = 2
                       * H2 in Table 3: model = 2
                       * H3 in Table 3: model = 2
