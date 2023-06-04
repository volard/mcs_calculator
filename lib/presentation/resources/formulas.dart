import '../../generated/l10n.dart';
import 'package:flutter/material.dart';



String avgPendingTimeDescription(BuildContext context) => r"""
<p> 
  $$ \overline{W} = \frac{L}{A} $$

  \(L\) - """ + S.of(context).queueLength + r"""<br> 
  \(A\) - """ + S.of(context).absoluteThroughput + r"""
</p> 
""";

String loadFactorDescription(BuildContext context) => r"""
<p>

  $$\rho = \frac{\lambda}{\mu}$$ <br>
  
  \(m\) - """ + S.of(context).channelsQuantity + r"""<br>
  \(\mu\) - """ + S.of(context).serviceTime + r"""

</p>
""";

String absoluteThroughputDescription(BuildContext context) => r"""
<p> 
  $$ A = \lambda Q $$

  \(\lambda\) - """ + S.of(context).inputStreamIntensity + r"""<br>
  \(Q\) - """ + S.of(context).relativeThroughput + r"""
</p>
""";



String relativeThroughputDescription(BuildContext context) => r"""
<p>
  $$ Q = 1 - P_{""" + S.of(context).reject + r"""} $$

  \(P_{""" + S.of(context).reject + r"""}\) - """ + S.of(context).requestRejectionProbability + r"""
</p>
""";

String relativeThroughputDescriptionInfinity(BuildContext context) => r"""
<p>
  $$ Q = 1 - P_{""" + S.of(context).reject + r"""} = 1 $$

  \(P_{""" + S.of(context).reject + r"""}\) - """ + S.of(context).requestRejectionProbability + r"""
</p>
""";

String requestRejectionProbabilityDescriptionInfinity(BuildContext context) => r"""
<p>
  $$ P_{""" + S.of(context).reject + r"""} = 0 (k = \infty)$$

  \(k\) - """ + S.of(context).pendingCapacity + r"""
</p>
""";


String requestRejectionProbabilityDescription(BuildContext context) => r"""
<p>
$$ P_{""" + S.of(context).reject + r"""} = P_{n+m} (k = C) $$

  \(C\) - """ + S.of(context).constant + r"""<br>
  \(k\) - """ + S.of(context).pendingCapacity + r"""<br>
  \(P_{n+m}\) - """ + S.of(context).PnmDescription + r"""
</p>
""";

String PnmDescription(BuildContext context) => r"""
<p>
  $$ P_{n+i} = \frac{\rho^{n+i}}{(n+i)! n^i} P_0, i = n ... m $$
  
  \(P_0\) - """ + S.of(context).pZeroDescription + r"""
</p>
""";

String pZeroDescription(BuildContext context) => r"""
<p>

  $$ P_0 = \Bigg[ \sum^{n}_{i=0} \frac{\rho^i}{i!} + \frac{\rho^{n+1}}{n!(n-p)}\bigg(1 - \big( \frac{\rho}{n} \big)^m \bigg) \Bigg]^{-1} $$
  
  \(n\) - """ + S.of(context).channelsQuantity + r"""<br>
  \(m\) - """ + S.of(context).pendingCapacity + r"""<br>
  \(\rho\) - """ + S.of(context).loadFactor + r"""<br>
  
</p>
""";

String pZeroDescriptionInfinity(BuildContext context) => r"""
<p>

  $$ P_0 = \Bigg[ \sum^{n}_{i=0} \frac{\rho^i}{i!} + \frac{\rho^{n+1}}{n!(n-p)} \Bigg]^{-1} $$
  
  \(n\) - """ + S.of(context).channelsQuantity + r"""<br>
  \(\rho\) - """ + S.of(context).loadFactor + r"""<br>
  
</p>
""";

String queueLengthDescription(BuildContext context) => r"""
<p>

  $$ \begin{array}{cl} \overline{L_{""" + S.of(context).queue + r"""}} = P_0 \frac{\rho^{n+1}}{n!n}\cdot \frac{\Big(1 - \big( \frac{\rho}{n} \big)^m \Big)}{\Big( 1 - \frac{\rho}{n} \Big)^2} \cdot \\
   \cdot \Big( m + 1 - m \frac{\rho}{n} \Big) \end{array} $$

  \(n\) - """ + S.of(context).channelsQuantity + r"""<br>
  \(m\) - """ + S.of(context).pendingCapacity + r"""<br>
  \(\rho\) - """ + S.of(context).loadFactor + r"""<br>

</p>
""";

//$$ \begin{array}{cl} \overline{L_{""" + S.of(context).queue + r"""}} = P_0 \frac{\rho^{n+1}}{n!n}\cdot \frac{\Big(1 - \big( \frac{\rho}{n} \big)^m \Big)}{\Big( 1 - \frac{\rho}{n} \Big)^2} \\\dot \Big( m + 1 - m \frac{\rho}{n} \Big) \end{array} $$

String queueLengthDescriptionInfinity(BuildContext context) => r"""
<p>

  $$ \overline{L_{""" + S.of(context).queue + r"""}} = \frac{n}{n - \rho} P_{""" + S.of(context).queue + r"""} $$

  \(n\) - """ + S.of(context).channelsQuantity + r"""<br>
  \(\rho\) - """ + S.of(context).loadFactor + r"""<br>
  \(P_{""" + S.of(context).queue + r"""}\) - """ + S.of(context).P_queue + r"""
</p>
""";

String P_queueDescription(BuildContext context) => r"""
<p>

  $$ P_{""" + S.of(context).queue + r"""} = \frac{\rho^{n+1}}{n!(n-\rho)}P_0 $$

  \(n\) - """ + S.of(context).channelsQuantity + r"""<br>
  \(\rho\) - """ + S.of(context).loadFactor + r"""
</p>    
""";

String requestsQuantityDescription(BuildContext context) => r"""
<p>    
    
    $$ \overline{L_{""" + S.of(context).MSS + r"""}} = \overline{L_{""" + S.of(context).queue + r"""}} + \rho Q $$
    
    \(\overline{L_{""" + S.of(context).queue + r"""}}\) - """ + S.of(context).queueLength + r"""<br>
    \(\rho\) - """ + S.of(context).loadFactor + r"""<br>
    \(Q\) - """ + S.of(context).relativeThroughput + r"""
    
</p> 
""";