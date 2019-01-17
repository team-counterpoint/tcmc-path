/*
 * Original work Copyright (c) 2017, Amirhossein Vakili, Sabria Farheen,
 *     Nancy A. Day, Ali Abbassi
 * Modified work Copyright (c) 2019, Mitchell Kember, Thi My Linh Tran,
 *     Yuezhou Gao, Nancy A. Day
 * This file is part of the TCMC-Path project, which is released under the
 * FreeBSD License. See LICENSE.txt for full license details, or visit
 * https://opensource.org/licenses/BSD-2-Clause.
 */

module ctlfc_path[S]

private one sig TS {
    S0: some S,
    sigma: S -> S,
    FC: set S
}

private sig Path {
    next: lone Path,
    state: one S
}

private one sig P0 in Path {}

fun pathState: S { Path.state }
fun pathSigma: S -> S { ~state.next.state }

fact {
    // Successive states in path are connected by transitions.
    pathSigma in TS.sigma
    // It includes an initial state.
    P0.state in TS.S0
    // The path is connected.
    P0.*next = Path
}

open ctl_core[TS.S0, pathSigma, TS.FC]
