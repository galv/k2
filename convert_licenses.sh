# cu,h
# py,cmake

# https://gist.github.com/Rypac/7349957f95f0713143fda2f3d3bc10c8

read -r -d '' replacement << EOM
   Copyright     \1 See LICENSE for clarification regarding multiple authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
EOM


codemod --exclude-paths build -m -d . --extensions cu,h \
        "Copyright \(c\) (.+) See LICENSE for clarification regarding multiple authors" \
        "$replacement"


read -r -d '' replacement << EOM
   Copyright     \1 authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOM

codemod --exclude-paths build -m -d scripts --extensions cmake,py \
        "Copyright \(c\) (.+) authors" \
        "$replacement"

codemod --exclude-paths build -m -d .github --extensions yml \
        "Copyright \(c\) (.+) authors" \
        "$replacement"

read -r -d '' replacement << EOM
   Copyright     \1
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOM

codemod --exclude-paths build -d scripts --extensions sh \
        "Copyright \(c\) (.+)" \
        "$replacement"
