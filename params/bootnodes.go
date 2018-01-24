// Copyright 2015 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package params

// MainnetBootnodes are the enode URLs of the P2P bootstrap nodes running on
// the main Goldiam network.
var MainnetBootnodes = []string{
	"enode://8c6ddfa2265d2eb7a817a8b85fefe0e0014dfd72208e37b99a239fc2c5b0bf36498131a27080993d6fa12e1f927f29400a22ad8839bf1d2298b8a1efc684f2ae@159.89.11.168:52018",  //Germany/Frankfurt
	"enode://8734af7e4c9ae0703d4e05cd6eb6f5761a8ee4b11f4bd528ff8e206daf8f4c1f73189bab73cc090102e31b84c5e3694985d077f8a8d69e1c443ccc235f51b01c@46.101.21.192:52018",  //UnitedKingdom/London
	"enode://3c15548b70925dfe2e6f09da143b97f1b894e775d660f63979604952ca28347a6610bc1dffa694b8a86f3e912da4ab82a9009065410492c6fa901b9dcb3ae1f6@82.196.0.221:52018",   //Netherlands/Amsterdam
	"enode://f3b197287ee6d2bd19be19cd74bed5b57fd5be67503053b42a52897b329c9eadf113a89b7b772680b55b3bb34681267766a13d0a8ddda058129f2bcc49a8f469@194.135.93.62:52018",  //Lithuania/Vilnius
	"enode://05172e73e69050889df9e55b7c0a10c85a5e3ebc1080ed32faa392eebb40a6bb99d649847a37f5abbcd632ce5a5fa36d0246e0b33241072201045508a5e05e5f@159.89.189.241:52018", //UnitedStates/NewYork
}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Ropsten test network.
var TestnetBootnodes = []string{
	"enode://277c002043c2937a333c02b277638ea1da28c5ec78a463903dbe860e345f24f48a26bb8076d45d849275109ea93ae7312a212c98ee2903971c6ee0f17cde43b6@159.89.25.11:52018",     //Germany/Frankfurt
	"enode://ecd0764c51de7b011a1c487aae74b30f1f23768cb55c7ecd454ff8c0d608d8825464d719f1cb7356718a87f1d946f3557cbb3f9bf29ea0998b296b8cb29d8a4d@188.166.153.227:520188", //UnitedKingdom/London
	"enode://58b8de8ad7511da01a2e9a17f4dbc26fa032a7f2442754ceb91fd44ee000797e2172722ba9e1e987671f58749b3f65b56987a5e625a3733bc816a64ad5cae975@165.227.110.208:52018",  //UnitedStates/NewYork
}

// RinkebyBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network.
var RinkebyBootnodes = []string{
// "enode://a24ac7c5484ef4ed0c5eb2d36620ba4e4aa13b8c84684e1b4aab0cebea2ae45cb4d375b77eab56516d34bfbd3c1a833fc51296ff084b770b94fb9028c4d25ccf@52.169.42.101:30303", // IE
// "enode://343149e4feefa15d882d9fe4ac7d88f885bd05ebb735e547f12e12080a9fa07c8014ca6fd7f373123488102fe5e34111f8509cf0b7de3f5b44339c9f25e87cb8@52.3.158.184:30303",  // INFURA
}

// RinkebyV5Bootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network for the experimental RLPx v5 topic-discovery network.
var RinkebyV5Bootnodes = []string{
// "enode://a24ac7c5484ef4ed0c5eb2d36620ba4e4aa13b8c84684e1b4aab0cebea2ae45cb4d375b77eab56516d34bfbd3c1a833fc51296ff084b770b94fb9028c4d25ccf@52.169.42.101:30303?discport=30304", // IE
// "enode://343149e4feefa15d882d9fe4ac7d88f885bd05ebb735e547f12e12080a9fa07c8014ca6fd7f373123488102fe5e34111f8509cf0b7de3f5b44339c9f25e87cb8@52.3.158.184:30303?discport=30304",  // INFURA
}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{
	"enode://8c6ddfa2265d2eb7a817a8b85fefe0e0014dfd72208e37b99a239fc2c5b0bf36498131a27080993d6fa12e1f927f29400a22ad8839bf1d2298b8a1efc684f2ae@159.89.11.168:52018",  //Germany/Frankfurt
	"enode://8734af7e4c9ae0703d4e05cd6eb6f5761a8ee4b11f4bd528ff8e206daf8f4c1f73189bab73cc090102e31b84c5e3694985d077f8a8d69e1c443ccc235f51b01c@46.101.21.192:52018",  //UnitedKingdom/London
	"enode://3c15548b70925dfe2e6f09da143b97f1b894e775d660f63979604952ca28347a6610bc1dffa694b8a86f3e912da4ab82a9009065410492c6fa901b9dcb3ae1f6@82.196.0.221:52018",   //Netherlands/Amsterdam
	"enode://f3b197287ee6d2bd19be19cd74bed5b57fd5be67503053b42a52897b329c9eadf113a89b7b772680b55b3bb34681267766a13d0a8ddda058129f2bcc49a8f469@194.135.93.62:52018",  //Lithuania/Vilnius
	"enode://05172e73e69050889df9e55b7c0a10c85a5e3ebc1080ed32faa392eebb40a6bb99d649847a37f5abbcd632ce5a5fa36d0246e0b33241072201045508a5e05e5f@159.89.189.241:52018", //UnitedStates/NewYork
}
