Configuration HyperVCluster
{ 
    Import-DSCResource -ModuleName cFailoverCluster
    
    Node $AllNodes.NodeName
    { 
        cClusterNetworking PublicClusterNetwork
        { 
            NetworkSubnet      = $Node.ClusterNetworkPublicSubnet
            NetworkPrefix = $Node.ClusterNetworkPublicPrefix
            NetworkName     = $Node.ClusterNetworkPublicName
        }

        cClusterNetworking CSVClusterNetwork
        { 
            NetworkSubnet      = $Node.ClusterNetworkCSVSubnet
            NetworkPrefix = $Node.ClusterNetworkCSVPrefix
            NetworkName     = $Node.ClusterNetworkCSVName
            NetworkMetric  = $Node.ClusterNetworkCSVMetric
        }

        cClusterNetworking LMClusterNetwork
        { 
            NetworkSubnet      = $Node.ClusterNetworkLMSubnet
            NetworkPrefix = $Node.ClusterNetworkLMPrefix
            NetworkName     = $Node.ClusterNetworkLMName
            NetworkMetric  = $Node.ClusterNetworkLMMetric
        }
    }
}

$ClusterConfig = @{ 
    AllNodes = @( 
 
        @{ 
            NodeName= "*" 
            ClusterNetworkPublicSubnet = "10.8.115.0"
            ClusterNetworkPublicPrefix = "24"
            ClusterNetworkPublicName = "Public"
            ClusterNetworkCSVSubnet = "10.11.101.0"
            ClusterNetworkCSVPrefix = "24"
            ClusterNetworkCSVName = "Cluster Shared Volume"
            ClusterNetworkCSVMetric = "800"
            ClusterNetworkLMSubnet = "10.11.100.0"
            ClusterNetworkLMPrefix = "24"
            ClusterNetworkLMName = "Live Migration"
            ClusterNetworkLMMetric = "1000"
        }, 
 
         # Node01 
        @{ 
            NodeName= "Server01"
         }, 
 
         # Node02 
         @{ 
            NodeName= "Server02"
         },
        
         # Node03 
         @{ 
            NodeName= "Server03"
         }
    ); 
} 

